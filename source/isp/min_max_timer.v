module min_max_timer #(
    parameter TIMER_WIDTH = 32
)(
    input  wire clk,
    input  wire rst,

    input  wire start,
    input  wire stop,

    input  wire min_ready,
    input  wire max_ready,
    output reg  min_valid,
    output reg  max_valid,
    output reg  timer_overflow,
    output reg  [TIMER_WIDTH-1:0] min_time_consumed,
    output reg  [TIMER_WIDTH-1:0] max_time_consumed
);

    localparam [TIMER_WIDTH-1:0] MAX_COUNT = {TIMER_WIDTH{1'b1}};

    reg [TIMER_WIDTH-1:0] time_count;
    reg                   running;
    reg                   start_d;
    reg                   stop_d;
    reg                   first_write;

    // Internal best values. These may be newer than the values currently
    // presented on the outputs while a valid/ready handshake is pending.
    reg [TIMER_WIDTH-1:0] min_value;
    reg [TIMER_WIDTH-1:0] max_value;

    wire start_pulse = start & ~start_d;
    wire stop_pulse  = stop  & ~stop_d;

    wire capture_en = stop_pulse && running;

    // Preserve original timing: stop cycle is not counted.
    wire [TIMER_WIDTH-1:0] capture_value = time_count;

    wire min_handshake = min_valid && min_ready;
    wire max_handshake = max_valid && max_ready;

    wire new_min = capture_en && (first_write || capture_value < min_value);
    wire new_max = capture_en && (first_write || capture_value > max_value);

    always @(posedge clk) begin
        if (rst) begin
            min_time_consumed <= {TIMER_WIDTH{1'b0}};
            max_time_consumed <= {TIMER_WIDTH{1'b0}};
            min_value         <= {TIMER_WIDTH{1'b1}};
            max_value         <= {TIMER_WIDTH{1'b0}};
            time_count        <= {TIMER_WIDTH{1'b0}};
            running           <= 1'b0;
            start_d           <= 1'b0;
            stop_d            <= 1'b0;
            min_valid         <= 1'b0;
            max_valid         <= 1'b0;
            timer_overflow    <= 1'b0;
            first_write       <= 1'b1;
        end else begin
            start_d <= start;
            stop_d  <= stop;

            // ------------------------------------------------------------
            // Timer start/stop
            // ------------------------------------------------------------
            if (capture_en) begin
                // Stop while running.
                // If start and stop arrive together while running,
                // stop has priority.
                running <= 1'b0;
            end
            else if (start_pulse && !running) begin
                // Start.
                // If start and stop arrive together while idle, this
                // starts the timer because stop is ignored when idle.
                running        <= 1'b1;
                time_count     <= {TIMER_WIDTH{1'b0}};
                timer_overflow <= 1'b0;
            end
            else if (running) begin
                if (time_count == MAX_COUNT)
                    timer_overflow <= 1'b1;
                else
                    time_count <= time_count + 1'b1;
            end

            // ------------------------------------------------------------
            // Minimum tracking, standard valid/ready stability
            // ------------------------------------------------------------
            if (min_handshake)
                min_valid <= 1'b0;

            if (new_min) begin
                min_value <= capture_value;

                // Present immediately only if the output is free or is
                // being accepted this cycle.
                if (min_handshake || !min_valid) begin
                    min_time_consumed <= capture_value;
                    min_valid         <= 1'b1;
                end
            end
            else if (min_handshake && (min_value != min_time_consumed)) begin
                // Previous transfer just completed, but a newer minimum
                // arrived while waiting. Present it now.
                min_time_consumed <= min_value;
                min_valid         <= 1'b1;
            end

            // ------------------------------------------------------------
            // Maximum tracking, standard valid/ready stability
            // ------------------------------------------------------------
            if (max_handshake)
                max_valid <= 1'b0;

            if (new_max) begin
                max_value <= capture_value;

                if (max_handshake || !max_valid) begin
                    max_time_consumed <= capture_value;
                    max_valid         <= 1'b1;
                end
            end
            else if (max_handshake && (max_value != max_time_consumed)) begin
                max_time_consumed <= max_value;
                max_valid         <= 1'b1;
            end

            // ------------------------------------------------------------
            // First measurement initializes both min and max
            // ------------------------------------------------------------
            if (capture_en)
                first_write <= 1'b0;
        end
    end

endmodule
