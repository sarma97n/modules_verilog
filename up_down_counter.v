module up_down_counter(
    input clk, reset, mode,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) count <= 4'd0;
    else if (mode) count <= count + 4'd1;
    else count <= count - 4'd1;
end
endmodule