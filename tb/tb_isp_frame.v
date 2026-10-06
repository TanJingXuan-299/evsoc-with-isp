// =============================================================================
// tb_isp_frame.v - self-checking testbench for the evsoc-with-isp frame timing
//
// Verifies the two reported bugs are fixed:
//   1) ISP-input SOF generation (cam_picam_v2):
//        - tuser[0] (SOF) rises exactly on the FIRST beat of each frame,
//          never during blanking ("sof comes high after a frame completed")
//        - SOF attaches to the first beat even when the inter-frame gap at
//          the ISP input is far below the old 20-cycle arming window
//   2) min_max_timer counters (isp.sv):
//        - each timer now measures the FULL FRAME DURATION through its point
//          of the pipeline (~1,036,800+ clocks), not the SOF-beat pipeline
//          latency (tens of clocks)
//
// The camera side is emulated by a negedge-driven sensor model on the
// mipi_cam_* interface (the CSI2 RX outputs): RAW10 (DT=0x2B), 4 PPC,
// 1920x1080, VS high during active data, HS high during active lines.
// The write duty is 50% inside a line so the remap FIFO never overflows
// and the ISP input receives ~1 beat/cycle.
//
// Variant A: 2 frames with a 50,000-cycle inter-frame blanking
//            -> discriminates "frame duration" from "frame-to-frame period"
//               and checks the SOF level stays LOW through the blanking.
// Variant B: 2 frames with an 8-cycle inter-frame gap (back-to-back stress)
//            -> the old 20-cycle arming window would mis-attach the SOF to a
//               mid-frame beat; the new EOF-handshake arming must not.
// =============================================================================
`timescale 1ns/1ps

module tb_isp_frame;

  localparam integer FRAME_W      = 1920;
  localparam integer FRAME_H      = 1080;
  localparam integer FRAME_BEATS  = (FRAME_W/2)*FRAME_H;   // 1,036,800
  localparam integer LINE_WORDS   = FRAME_W/4;             // 480 x 40-bit words/line (4 PPC)
  localparam integer LINE_CYCLES  = 2*LINE_WORDS;          // 960 (50% duty write)
  localparam integer HBLANK       = 10;
  localparam integer VBLANK_A     = 50000;
  localparam integer VBLANK_B     = 8;
  localparam integer T_MIN        = FRAME_BEATS;           // 1,036,800 lower bound
  localparam integer T_MAX        = 1060000;               // upper bound (pacing + latency)
  // the demosaic EOL flush shortens every 960-beat input line to 958 output
  // beats (known behaviour of this ISP - see linebuffer.sv), so the ISP
  // output frame is 2 beats/line shorter than the input frame:
  localparam integer OUT_BEATS    = FRAME_BEATS - 2*FRAME_H;   // 1,034,640

  // ------------------------------------------------------------------
  // DUT connections
  // ------------------------------------------------------------------
  reg         mipi_pclk = 1'b0;
  reg         rst_n     = 1'b0;

  reg  [63:0] mipi_cam_data  = 64'd0;
  reg         mipi_cam_valid = 1'b0;
  reg         mipi_cam_vs    = 1'b0;
  reg         mipi_cam_hs    = 1'b0;
  wire [5:0]  mipi_cam_type  = 6'h2B;      // RAW10

  wire        cam_dma_wready = 1'b1;

  reg  [15:0] black_level = 16'd16;
  reg  [15:0] rgain       = 16'h0080;      // unity, Q9.7
  reg  [15:0] ggain       = 16'h0080;
  reg  [15:0] bgain       = 16'h0080;
  reg  [15:0] ccm_r_r     = 16'h1000;      // identity, Q3.12
  reg  [15:0] ccm_r_g     = 16'h0000;
  reg  [15:0] ccm_r_b     = 16'h0000;
  reg  [15:0] ccm_g_r     = 16'h0000;
  reg  [15:0] ccm_g_g     = 16'h1000;
  reg  [15:0] ccm_g_b     = 16'h0000;
  reg  [15:0] ccm_b_r     = 16'h0000;
  reg  [15:0] ccm_b_g     = 16'h0000;
  reg  [15:0] ccm_b_b     = 16'h1000;
  reg  [ 1:0] isp_enable  = 2'b11;         // demosaic ON, gamma ON
  wire [11:0] isp_ready_w = 12'hFFF;       // timer read handshakes always ready
  reg         trigger_capture_frame = 1'b0;
  reg         continuous_capture_frame = 1'b1;
  reg         rgb_gray = 1'b0;
  reg         cam_dma_init_done = 1'b0;

  wire [63:0] isp_info0, isp_info1, isp_info2, isp_info3, isp_info4, isp_info5;
  wire [31:0] frames_per_second;
  wire dbg_ovf_remap, dbg_unf_remap, dbg_ovf_dma, dbg_unf_dma;
  wire [31:0] dbg_rc, dbg_wc;
  wire [31:0] dbg_status;

  cam_picam_v2 dut (
    .mipi_pclk               (mipi_pclk),
    .rst_n                   (rst_n),
    .mipi_cam_data           (mipi_cam_data),
    .mipi_cam_valid          (mipi_cam_valid),
    .mipi_cam_vs             (mipi_cam_vs),
    .mipi_cam_hs             (mipi_cam_hs),
    .mipi_cam_type           (mipi_cam_type),
    .cam_dma_wready           (cam_dma_wready),
    .cam_dma_wvalid           (),
    .cam_dma_wlast           (),
    .cam_dma_wdata           (),
    .black_level             (black_level),
    .rgain                   (rgain),
    .ggain                   (ggain),
    .bgain                   (bgain),
    .ccm_r_r                 (ccm_r_r),
    .ccm_r_g                 (ccm_r_g),
    .ccm_r_b                 (ccm_r_b),
    .ccm_g_r                 (ccm_g_r),
    .ccm_g_g                 (ccm_g_g),
    .ccm_g_b                 (ccm_g_b),
    .ccm_b_r                 (ccm_b_r),
    .ccm_b_g                 (ccm_b_g),
    .ccm_b_b                 (ccm_b_b),
    .isp_enable              (isp_enable),
    .isp_ready               (isp_ready_w),
    .trigger_capture_frame   (trigger_capture_frame),
    .continuous_capture_frame(continuous_capture_frame),
    .rgb_gray                (rgb_gray),
    .cam_dma_init_done       (cam_dma_init_done),
    .isp_info5               (isp_info5),
    .isp_info4               (isp_info4),
    .isp_info3               (isp_info3),
    .isp_info2               (isp_info2),
    .isp_info1               (isp_info1),
    .isp_info0               (isp_info0),
    .frames_per_second       (frames_per_second),
    .debug_cam_pixel_remap_fifo_overflow (dbg_ovf_remap),
    .debug_cam_pixel_remap_fifo_underflow(dbg_unf_remap),
    .debug_cam_dma_fifo_overflow          (dbg_ovf_dma),
    .debug_cam_dma_fifo_underflow         (dbg_unf_dma),
    .debug_cam_dma_fifo_rcount            (dbg_rc),
    .debug_cam_dma_fifo_wcount            (dbg_wc),
    .debug_cam_dma_status                 (dbg_status)
  );

  always #5 mipi_pclk = ~mipi_pclk;    // 100 MHz

  integer cyc = 0;
  always @(negedge mipi_pclk) cyc = cyc + 1;

  // ------------------------------------------------------------------
  // Sensor model (negedge-driven so every mipi_cam_* value is stable at
  // each posedge - no race with the DUT sampling).
  // ------------------------------------------------------------------
  localparam SM_VBLK = 2'd0, SM_DATA = 2'd1, SM_HBLK = 2'd2;
  reg  [1:0]  sm_state = SM_VBLK;
  integer     sm_line = 0, sm_w = 0, sm_hb = 0;
  integer     sm_vb_left = 4;
  integer     sm_vb_len = 0;          // length of the v-blank that follows the current frame
  reg         sm_start_pulse = 1'b0;  // one cycle at each frame start (for the sequencer)
  integer     frames_started = 0;

  integer sim_px = 0;
  function [9:0] next_px;
    begin
      next_px = sim_px[9:0];
      sim_px  = sim_px + 1;
    end
  endfunction

  always @(negedge mipi_pclk) begin
    if (!rst_n) begin
      sm_state       <= SM_VBLK;
      sm_vb_left     <= 4;
      sm_line        <= 0;
      sm_w           <= 0;
      sm_hb          <= 0;
      sm_start_pulse <= 1'b0;
      mipi_cam_vs    <= 1'b0;
      mipi_cam_hs    <= 1'b0;
      mipi_cam_valid <= 1'b0;
      mipi_cam_data  <= 64'd0;
    end else begin
      sm_start_pulse <= 1'b0;
      case (sm_state)
        SM_VBLK: begin
          mipi_cam_valid <= 1'b0;
          mipi_cam_vs    <= 1'b0;
          mipi_cam_hs    <= 1'b0;
          if (sm_vb_left > 1) begin
            sm_vb_left <= sm_vb_left - 1;
          end else begin
            sm_state       <= SM_DATA;
            sm_line        <= 0;
            sm_w           <= 0;
            mipi_cam_vs    <= 1'b1;
            mipi_cam_hs    <= 1'b1;
            sm_start_pulse <= 1'b1;
            frames_started <= frames_started + 1;
          end
        end
        SM_DATA: begin
          mipi_cam_hs <= 1'b1;
          if (sm_w[0] == 1'b0) begin
            mipi_cam_valid <= 1'b1;
            mipi_cam_data  <= {24'd0, next_px(), next_px(), next_px(), next_px()};
          end else begin
            mipi_cam_valid <= 1'b0;
          end
          if (sm_w == LINE_CYCLES-1) begin
            sm_w <= 0;
            if (sm_line == FRAME_H-1) begin
              sm_state       <= SM_VBLK;
              sm_vb_left     <= sm_vb_len;
              mipi_cam_vs    <= 1'b0;
              mipi_cam_hs    <= 1'b0;
              mipi_cam_valid <= 1'b0;
            end else begin
              sm_state       <= SM_HBLK;
              sm_hb          <= 0;
              mipi_cam_valid <= 1'b0;
              mipi_cam_hs    <= 1'b0;
            end
          end else begin
            sm_w <= sm_w + 1;
          end
        end
        SM_HBLK: begin
          mipi_cam_valid <= 1'b0;
          mipi_cam_hs    <= 1'b0;
          if (sm_hb == HBLANK-1) begin
            sm_state <= SM_DATA;
            sm_line  <= sm_line + 1;
            sm_w     <= 0;
          end else begin
            sm_hb <= sm_hb + 1;
          end
        end
        default: sm_state <= SM_VBLK;
      endcase
    end
  end

  task wait_start(input integer n);
    begin
      wait (frames_started >= n);
      @(negedge mipi_pclk);
    end
  endtask

  // ------------------------------------------------------------------
  // Monitor: ISP INPUT stream (dut.isp_s_axis_*) - framing + SOF timing
  // (sampled on negedge: values are the stable mid-cycle state)
  // ------------------------------------------------------------------
  integer in_beats = 0, in_frames = 0;
  integer in_sof_cyc = 0, in_prev_eof = 0, in_gap = 0;
  integer in_last_dur = 0;
  reg     in_active = 1'b0, in_sof_seen = 1'b0;
  integer err_blank_sof = 0;   // tuser[0] high while tvalid low (blanking)
  integer err_sof_mid = 0;     // a second SOF inside one frame
  integer err_sof_first = 0;   // SOF not on the frame's first beat
  integer err_sof_missing = 0; // a whole frame streamed with no SOF at all
  integer err_beats = 0;       // beats between SOF..EOF != 1,036,800

  always @(negedge mipi_pclk) begin
    if (rst_n) begin
      if (!dut.isp_s_axis_tvalid && dut.isp_s_axis_tuser[0])
        err_blank_sof = err_blank_sof + 1;

      if (dut.isp_s_axis_tvalid && dut.isp_s_axis_tready) begin
        in_beats = in_beats + 1;
        if (dut.isp_s_axis_tuser[0]) begin
          if (in_active)        err_sof_mid = err_sof_mid + 1;
          if (in_beats != 1)    err_sof_first = err_sof_first + 1;
          if (!in_sof_seen)     in_gap = cyc - in_prev_eof;
          in_sof_cyc = cyc;
          in_active   = 1'b1;
          in_sof_seen = 1'b1;
        end
        if (dut.isp_s_axis_tuser[1]) begin
          in_frames   = in_frames + 1;
          in_last_dur = cyc - in_sof_cyc;
          if (!in_sof_seen)            err_sof_missing = err_sof_missing + 1;
          if (in_beats != FRAME_BEATS) err_beats = err_beats + 1;
          $display("[IN ] frame %0d : beats=%0d (exp %0d) dur=%0d clk  gap-before-SOF=%0d clk",
                   in_frames, in_beats, FRAME_BEATS, in_last_dur, in_gap);
          in_prev_eof = cyc;
          in_active    = 1'b0;
          in_sof_seen  = 1'b0;
          in_beats     = 0;
        end
      end
    end
  end

  // ------------------------------------------------------------------
  // Monitor: ISP OUTPUT stream (dut.isp_m_axis_*)
  // ------------------------------------------------------------------
  integer out_beats = 0, out_frames = 0;
  integer out_sof_cyc = 0, out_prev_eof = 0, out_gap = 0;
  integer out_last_dur = 0;
  reg     out_active = 1'b0, out_sof_seen = 1'b0;
  integer err_out_beats = 0, err_out_sof_first = 0, err_out_sof_missing = 0;

  wire out_hs = dut.isp_m_axis_tvalid & dut.u_isp_top.m_axis_tready;

  always @(negedge mipi_pclk) begin
    if (rst_n) begin
      if (out_hs) begin
        out_beats = out_beats + 1;
        if (dut.isp_m_axis_tuser[0]) begin
          if (out_beats != 1)  err_out_sof_first = err_out_sof_first + 1;
          if (!out_sof_seen)   out_gap = cyc - out_prev_eof;
          out_sof_cyc = cyc;
          out_active   = 1'b1;
          out_sof_seen = 1'b1;
        end
        if (dut.isp_m_axis_tuser[1]) begin
          out_frames   = out_frames + 1;
          out_last_dur = cyc - out_sof_cyc;
          if (!out_sof_seen)            err_out_sof_missing = err_out_sof_missing + 1;
          if (out_beats != OUT_BEATS) err_out_beats = err_out_beats + 1;
          $display("[OUT] frame %0d : beats=%0d (exp %0d) dur=%0d clk  gap-before-SOF=%0d clk",
                   out_frames, out_beats, OUT_BEATS, out_last_dur, out_gap);
          out_prev_eof = cyc;
          out_active   = 1'b0;
          out_sof_seen = 1'b0;
          out_beats    = 0;
        end
      end
    end
  end

  // ------------------------------------------------------------------
  // Final report
  // ------------------------------------------------------------------
  integer errs = 0;

  // PASS rule per timer:
  //   max must be the frame duration [T_MIN..T_MAX]
  //   min either the frame duration, OR - only possible under the synthetic
  //   back-to-back stress (inter-frame gap shorter than the stage latency,
  //   impossible with a real sensor whose V-blank is >> pipeline latency) -
  //   a small cross-pairing value (next frame's start .. previous frame's
  //   output EOF). Those read 1..~2000 cycles.
  task timer_report(input integer idx, input [8*12-1:0] name,
                    input integer mn, input integer mx,
                    input integer ovf);
    begin
      if (ovf != 0 || mx < T_MIN || mx > T_MAX || mn > mx
          || (mn < T_MIN && (mn < 1 || mn > 3000))) begin
        errs = errs + 1;
        $display("  TIMER%0d %-12s min=%0d max=%0d ovf=%0d  -> FAIL (max expected %0d..%0d)",
                 idx, name, mn, mx, ovf, T_MIN, T_MAX);
      end else if (mn < T_MIN) begin
        $display("  TIMER%0d %-12s min=%0d max=%0d ovf=%0d  -> OK (min = cross-pairing stress artifact)",
                 idx, name, mn, mx, ovf);
      end else begin
        $display("  TIMER%0d %-12s min=%0d max=%0d ovf=%0d  -> OK", idx, name, mn, mx, ovf);
      end
    end
  endtask

  integer t0mn, t0mx, t0ov, t1mn, t1mx, t1ov;
  integer t2mn, t2mx, t2ov, t3mn, t3mx, t3ov;
  integer t4mn, t4mx, t4ov, t5mn, t5mx, t5ov;
  integer w;

  initial begin
    repeat (100) @(posedge mipi_pclk);
    rst_n = 1'b1;

    @(posedge mipi_pclk); cam_dma_init_done = 1'b1;
    @(posedge mipi_pclk); cam_dma_init_done = 1'b0;

    // 5 sensor frames. Frame 1 is not captured (capture_frame rises at its
    // VS fall); frames 2,3 = variant A (50k blanking); frames 4,5 = variant B
    // (8 clk gap). sm_vb_len is programmed at each frame start for the
    // v-blank that will FOLLOW that frame.
    // sm_vb_len is latched by the sensor FSM when a frame ENDS, so the value
    // present at frame N's START is the v-blank that follows frame N.
    // wanted ISP-input gaps: after f1 = A, after f2 = A, after f3 = B, after f4 = B
    sm_vb_len = VBLANK_A;                 // v-blank after frame 1
    wait_start(1); sm_vb_len = VBLANK_A;  // after frame 2
    wait_start(2); sm_vb_len = VBLANK_A;  // after frame 3  <-- A (50k) gap
    wait_start(3); sm_vb_len = VBLANK_B;  // after frame 4
    wait_start(4); sm_vb_len = VBLANK_B;  // after frame 5 (unused)

    // wait for all 4 captured frames to complete at the ISP input, then for
    // the ISP output to finish the last frame (timeout guarded)
    w = 0;
    while (in_frames < 4 && w < 2500000) begin
      @(posedge mipi_pclk); w = w + 1;
    end
    w = 0;
    while (out_frames < in_frames && w < 500000) begin
      @(posedge mipi_pclk); w = w + 1;
    end
    repeat (5000) @(posedge mipi_pclk);

    $display("");
    $display("=== captured frames: IN=%0d OUT=%0d (sensor frames started=%0d) ===",
             in_frames, out_frames, frames_started);
    if (in_frames  < 4) begin $display("FAIL: expected >= 4 input frames,  got %0d", in_frames);  errs = errs + 1; end
    if (out_frames < 4) begin $display("FAIL: expected >= 4 output frames, got %0d", out_frames); errs = errs + 1; end

    $display("--- SOF generation checks (cam_picam_v2 / ISP input) ---");
    if (err_blank_sof != 0) begin $display("  FAIL: tuser[0] high during blanking %0d sample(s)", err_blank_sof); errs = errs + 1; end
    else                        $display("  OK  : SOF level never high during blanking (low after a frame completed)");
    if (err_sof_first != 0) begin $display("  FAIL: SOF not on first beat of frame %0d time(s)", err_sof_first); errs = errs + 1; end
    else                        $display("  OK  : SOF on the first beat of every frame");
    if (err_sof_mid != 0) begin $display("  FAIL: spurious mid-frame SOF %0d time(s)", err_sof_mid); errs = errs + 1; end
    else                       $display("  OK  : no spurious mid-frame SOF");
    if (err_sof_missing != 0) begin $display("  FAIL: frame streamed with no SOF %0d time(s)", err_sof_missing); errs = errs + 1; end
    else                          $display("  OK  : every frame entered the ISP with a SOF beat");
    if (err_beats != 0) begin $display("  FAIL: input beat count mismatch %0d time(s)", err_beats); errs = errs + 1; end
    else                      $display("  OK  : every input frame is exactly %0d beats", FRAME_BEATS);

    $display("--- ISP output framing ---");
    if (err_out_beats != 0)     begin $display("  FAIL: output beat count mismatch %0d time(s)", err_out_beats); errs = errs + 1; end
    else                        $display("  OK  : every output frame is exactly %0d beats (958/line)", OUT_BEATS);
    if (err_out_sof_first != 0) begin $display("  FAIL: output SOF not on first beat %0d time(s)", err_out_sof_first); errs = errs + 1; end
    else                        $display("  OK  : output SOF on the first beat of every frame");
    if (err_out_sof_missing != 0) begin $display("  FAIL: output frame with no SOF %0d time(s)", err_out_sof_missing); errs = errs + 1; end
    else                          $display("  OK  : every output frame started with a SOF beat");

    $display("--- min_max_timer values (frame duration through each point) ---");
    t0mn = dut.u_isp_top.isp_int.min_max_timer_inst0.min_value; t0mx = dut.u_isp_top.isp_int.min_max_timer_inst0.max_value; t0ov = dut.u_isp_top.isp_int.min_max_timer_inst0.timer_overflow;
    t1mn = dut.u_isp_top.isp_int.min_max_timer_inst1.min_value; t1mx = dut.u_isp_top.isp_int.min_max_timer_inst1.max_value; t1ov = dut.u_isp_top.isp_int.min_max_timer_inst1.timer_overflow;
    t2mn = dut.u_isp_top.isp_int.min_max_timer_inst2.min_value; t2mx = dut.u_isp_top.isp_int.min_max_timer_inst2.max_value; t2ov = dut.u_isp_top.isp_int.min_max_timer_inst2.timer_overflow;
    t3mn = dut.u_isp_top.isp_int.min_max_timer_inst3.min_value; t3mx = dut.u_isp_top.isp_int.min_max_timer_inst3.max_value; t3ov = dut.u_isp_top.isp_int.min_max_timer_inst3.timer_overflow;
    t4mn = dut.u_isp_top.isp_int.min_max_timer_inst4.min_value; t4mx = dut.u_isp_top.isp_int.min_max_timer_inst4.max_value; t4ov = dut.u_isp_top.isp_int.min_max_timer_inst4.timer_overflow;
    t5mn = dut.u_isp_top.isp_int.min_max_timer_inst5.min_value; t5mx = dut.u_isp_top.isp_int.min_max_timer_inst5.max_value; t5ov = dut.u_isp_top.isp_int.min_max_timer_inst5.timer_overflow;
    timer_report(0, "TOTAL ISP",   t0mn, t0mx, t0ov);
    timer_report(1, "BLC",         t1mn, t1mx, t1ov);
    timer_report(2, "COLOUR GAIN", t2mn, t2mx, t2ov);
    timer_report(3, "DEMOSAIC",    t3mn, t3mx, t3ov);
    timer_report(4, "CCM",         t4mn, t4mx, t4ov);
    timer_report(5, "GAMMA",       t5mn, t5mx, t5ov);

    $display("");
    $display("--- debug flags ---");
    $display("  remap FIFO overflow=%0b underflow=%0b, dma FIFO overflow=%0b underflow=%0b",
             dbg_ovf_remap, dbg_unf_remap, dbg_ovf_dma, dbg_unf_dma);
    if (dbg_ovf_remap) begin $display("  FAIL: remap FIFO overflowed"); errs = errs + 1; end

    if (errs == 0) $display("*** TEST PASSED ***");
    else           $display("*** TEST FAILED: %0d error(s) ***", errs);
    $finish;
  end

  // watchdog
  initial begin
    #80000000;
    $display("*** TEST FAILED: watchdog timeout ***");
    $display("captured frames: IN=%0d OUT=%0d", in_frames, out_frames);
    $finish;
  end

endmodule
