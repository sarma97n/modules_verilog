module gray_binary(
    input [7:0] gray_in,
    output [7:0] binary_out
);

assign binary_out[7] = gray_in[7];
assign binary_out[6] = gray_in[7] ^ gray_in[6];
assign binary_out[5] = gray_in[6] ^ gray_in[5];
assign binary_out[4] = gray_in[5] ^ gray_in[4];
assign binary_out[3] = gray_in[4] ^ gray_in[3];
assign binary_out[2] = gray_in[3] ^ gray_in[2];
assign binary_out[1] = gray_in[2] ^ gray_in[1];
assign binary_out[0] = gray_in[1] ^ gray_in[0];

endmodule 