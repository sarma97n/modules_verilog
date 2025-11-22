module dec1x4(out,in,sel);
input in;
input [0:1]sel;
output [0:3]out;
assign out[sel]=in;
endmodule