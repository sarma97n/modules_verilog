module bit_slicing(a,b,y);
input [7:0] a,b;
output [15:0] y;

assign y[15:8] = a;
assign y[7:0] = b;

endmodule