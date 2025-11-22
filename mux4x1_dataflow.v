module mux4x1_dataflow(out, data_in, sel);
input [3:0]data_in;
input [1:0]sel;
output out;

assign out = (sel == 2'b00) ? data_in[0] 
           : (sel == 2'b01) ? data_in[1] 
           : (sel == 2'b10) ? data_in[2] 
           : data_in[3];

endmodule
