`timescale 1ns/1ps
`include "mux4x1_beh.v"

module mux4x1_beh_tb;
reg [3:0]data_in;
reg [1:0]sel;
wire out;

integer i, j;

mux4x1_beh dut (.out(out), .data_in(data_in), .sel(sel));
initial begin
    $dumpfile("mux4x1_beh.tb.vcd");
    $dumpvars(0,mux4x1_beh_tb);
    $display("\t\tTime\tInput\tSelect\tOutput");
    $monitor($time, "\t%b\t%b\t%b",data_in,sel,out);
    for(i = 0; i < 16; i++) begin
        data_in = i;
        for(j = 0; j < 4; j++) begin
            sel = j;
            #5;
        end
    end 
    #5 $finish;
end
endmodule