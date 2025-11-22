module even_parity(out, parity, data_in);
input [2:0]data_in;
output parity;
output [3:0]out;

assign parity = data_in[0] ^ data_in[1] ^ data_in[2];
assign out = {data_in,parity};

endmodule
