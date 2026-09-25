module timestamp_fifo #(
    parameter CNT_WIDTH     = 16,
    parameter POINTER_WIDTH = 8 //associate with maximum number of timestamps
)(
    input  wire clk,
    input  wire rstn,

    input  wire stamp_in,
    input  wire stamp_out,
    output reg  time_consumed_valid,
    output reg  [CNT_WIDTH-1:0] time_consumed,
    output reg  overflow,
    output reg  pointer_overwrite
);
    reg [CNT_WIDTH-1:0]       counter;
    reg [CNT_WIDTH-1:0]       in_timestamp [0:2**POINTER_WIDTH - 1];
    reg [POINTER_WIDTH - 1:0] pointer;
    reg [POINTER_WIDTH - 1:0] oldest_pointer;
    reg [POINTER_WIDTH - 1:0] missed_pointer;
    reg                       pre_overflow;
    reg                       pre_pointer_overwrite;
    wire                      empty;
    wire                      pre_full_cond;
    wire                      clear_pre_full_cond;
    wire                      accept_in;
    wire                      pre_overflow_cond;

    assign accept_in = stamp_in && !(pointer == oldest_pointer && pre_pointer_overwrite && !stamp_out)
                       && !pointer_overwrite;

    assign pre_full_cond = oldest_pointer - pointer == 1;

    assign clear_pre_full_cond = (oldest_pointer - pointer == 2) &&
                                 (pre_pointer_overwrite);

    assign empty = pointer == oldest_pointer && !pre_pointer_overwrite;

    assign pre_overflow_cond = counter == {CNT_WIDTH{1'b1}} && (!empty || accept_in) &&
                               !((pointer - oldest_pointer == 1 ) && stamp_out && !accept_in);

    always @(posedge clk) begin
        if (~rstn) begin
            counter               <= 0;
            time_consumed_valid   <= 0;
            time_consumed         <= 0;
            pointer               <= 0;
            oldest_pointer        <= 0;
            missed_pointer        <= 0;
            pre_overflow          <= 0;
            overflow              <= 0;
            pre_pointer_overwrite <= 0;
            pointer_overwrite     <= 0;
            for (integer i = 0; i < 2**POINTER_WIDTH; i = i + 1) begin
                in_timestamp[i]   <= 0;
            end
        end else begin
            counter <= counter + 1;

            if (counter == {CNT_WIDTH{1'b1}} && pre_overflow == 1) begin
                overflow       <= 1;
            end else if (pre_overflow_cond) begin
                counter        <= 0;
                pre_overflow   <= 1;
                missed_pointer <= accept_in ? pointer : pointer - 1;
            end

            if (stamp_in) begin
                if (pre_full_cond) begin
                    pre_pointer_overwrite <= 1;
                end
                if (pointer == oldest_pointer && pre_pointer_overwrite && !stamp_out) begin
                    pointer_overwrite     <= 1;
                end else if (!pointer_overwrite) begin
                    in_timestamp[pointer] <= counter;
                    pointer               <= pointer + 1;
                end
            end

            if (stamp_out) begin
                if (!pre_overflow_cond && oldest_pointer == missed_pointer && pre_overflow) begin
                    pre_overflow        <= 0;
                end
                if (pointer_overwrite) begin
                    pointer_overwrite <= 0;
                end
                if (empty) begin
                    time_consumed_valid <= 0;
                end else if (!pre_overflow) begin
                    time_consumed       <= counter - in_timestamp[oldest_pointer];
                    time_consumed_valid <= 1;
                    oldest_pointer      <= oldest_pointer + 1;
                end else begin
                    overflow            <= 1;
                    time_consumed_valid <= 0;
                end
            end else begin
                time_consumed_valid     <= 0;
            end

            if (clear_pre_full_cond) begin
                pre_pointer_overwrite   <= 0;
            end

        end
    end
endmodule
