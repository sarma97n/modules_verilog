`timescale 1ns/1ps
`include "mux2x1_dataflow.v"

module mux2x1_dataflow_tb;
reg [1:0] data_in;
reg sel;
wire out;

mux2x1_dataflow dut(out,data_in,sel);
initial begin
    $dumpfile("mux2x1_dataflow.tb.vcd");
    $dumpvars(0,mux2x1_dataflow_tb);
    $monitor($time, "data_in = %b, select = %b, out = %b",data_in, sel, out);
    #5 data_in = 2'b00; sel = 1'b0;
    #5 sel = 1'b1;
    #5 data_in = 2'b01; sel = 1'b0;
    #5 sel = 1'b1;
    #5 data_in = 2'b10; sel = 1'b0;
    #5 sel = 1'b1;
    #5 data_in = 2'b11; sel = 1'b0;
    #5 sel = 1'b1;
    #5 $finish;
end
endmodule
