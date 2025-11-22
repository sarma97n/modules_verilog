module mux2x1_dataflow(out,data_in,sel) ;
input [1:0] data_in;
input sel;
output out;

assign out = (sel) ? data_in[0] : data_in[1];

endmodule
