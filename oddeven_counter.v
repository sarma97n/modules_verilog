module oddeven_counter(
    input clk, reset, mode,
    output reg [15:0] count
);

always @(posedge clk or posedge reset) begin
   if (reset) count <= (mode) ?  16'd0 : 16'd1;
   else count <= count + 16'd2;
end
endmodule