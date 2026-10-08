module min_max_timer #(
    parameter TIMER_WIDTH       = 32,
    parameter START_COUNT_WIDTH = 8
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
    output reg  [TIMER_WIDTH-1:0] max_time_consumed,
    output wire [TIMER_WIDTH-1:0] time_consumed
);

    localparam [TIMER_WIDTH-1:0]       MAX_COUNT       = {TIMER_WIDTH{1'b1}};
    localparam [START_COUNT_WIDTH-1:0] START_COUNT_MAX = {START_COUNT_WIDTH{1'b1}};

    reg [TIMER_WIDTH-1:0] time_count;
    reg                   running;
    reg                   start_d;
    reg                   stop_d;
    reg                   first_write;

    assign time_consumed = time_count;

    // Internal best values.
    reg [TIMER_WIDTH-1:0] min_value;
    reg [TIMER_WIDTH-1:0] max_value;

    // Number of start pulses ignored while running.
    reg [START_COUNT_WIDTH-1:0] pending_start_count;

    wire start_pulse = ~start & start_d;
    wire stop_pulse  = ~stop  & stop_d;

    wire start_while_running = start_pulse && running;
    wire stop_while_running  = stop_pulse  && running;

    // Stop only belongs to the active frame if:
    //  - the timer is running,
    //  - no ignored start is still waiting for its matching stop,
    //  - this stop is not arriving together with another ignored start.
    wire capture_en = stop_while_running &&
                      !start_while_running &&
                      (pending_start_count == {START_COUNT_WIDTH{1'b0}});

    // Preserve original timing: stop cycle is not counted.
    wire [TIMER_WIDTH-1:0] capture_value = time_count;

    wire min_handshake = min_valid && min_ready;
    wire max_handshake = max_valid && max_ready;

    wire new_min = capture_en && (first_write || capture_value < min_value);
    wire new_max = capture_en && (first_write || capture_value > max_value);

    always @(posedge clk) begin
        if (rst) begin
            min_time_consumed   <= {TIMER_WIDTH{1'b0}};
            max_time_consumed   <= {TIMER_WIDTH{1'b0}};
            min_value           <= {TIMER_WIDTH{1'b1}};
            max_value           <= {TIMER_WIDTH{1'b0}};
            time_count          <= {TIMER_WIDTH{1'b0}};
            running             <= 1'b0;
            start_d             <= 1'b0;
            stop_d              <= 1'b0;
            min_valid           <= 1'b0;
            max_valid           <= 1'b0;
            timer_overflow      <= 1'b0;
            first_write         <= 1'b1;
            pending_start_count <= {START_COUNT_WIDTH{1'b0}};
        end else begin
            start_d <= start;
            stop_d  <= stop;

            // ------------------------------------------------------------
            // Track start pulses ignored while running.
            // A stop pulse first consumes one ignored start.
            // ------------------------------------------------------------
            if (start_while_running) begin
                if (!stop_while_running) begin
                    if (pending_start_count != START_COUNT_MAX)
                        pending_start_count <= pending_start_count + 1'b1;
                end
                // If start and stop arrive together while running, they are
                // treated as an ignored start/stop pair and cancel each other.
            end
            else if (stop_while_running && (pending_start_count != 0)) begin
                pending_start_count <= pending_start_count - 1'b1;
            end

            // ------------------------------------------------------------
            // Timer start/stop
            // ------------------------------------------------------------
            if (capture_en) begin
                // Stop the active frame.
                // If start and stop arrive together while running,
                // they are handled above as an ignored pair.
                running <= 1'b0;
            end
            else if (start_pulse && !running) begin
                // Start the active frame.
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

                if (min_handshake || !min_valid) begin
                    min_time_consumed <= capture_value;
                    min_valid         <= 1'b1;
                end
            end
            else if (min_handshake && (min_value != min_time_consumed)) begin
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
