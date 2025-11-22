module updown_gray_counter(
    input clk, reset, mode,
    output [3:0] gray
);

reg [3:0]binary;

always @(posedge clk or posedge reset) begin
    if (reset) binary <= 4'b0;
    else begin
        if (mode) binary <= binary + 1'b1;
        else binary <= binary - 1'b1;
    end
end

assign gray = binary ^ (binary >> 1);

endmodule