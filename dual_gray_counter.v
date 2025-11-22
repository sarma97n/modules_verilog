module dual_gray_counter(
    input clk, reset, 
    output [3:0] gray_4,
    output [2:0] gray_3
);

reg [3:0] binary_4;
reg [2:0] binary_3;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        binary_4 <= 4'b0000;
        binary_3 <= 3'b000;
    end
    else begin
        binary_4 <= binary_4 + 1'b1;
        binary_3 <= binary_3 + 1'b1;
    end
end

assign gray_4 = binary_4 ^ (binary_4 >> 1);
assign gray_3 = binary_3 ^ (binary_3 >> 1);
endmodule