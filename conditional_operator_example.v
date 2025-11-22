module conditional_operator_example(data_in,result);
input [3:0] data_in;
output [3:0] result;

assign result = (data_in > 4'b1001) ? 4'b1111: (data_in == 4'b0000) ? 4'b0000: data_in +1;

endmodule