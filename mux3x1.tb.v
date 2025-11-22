`timescale 1ns/1ps
`include "mux3x1.v"

module mux3x1_tb;
reg [2:0]in;
reg [1:0]sel;
wire out;

mux3x1 dut(.in(in), .sel(sel), .out(out));

initial begin
    $dumpfile("mux3x1.vcd");
    $dumpvars(0,mux3x1_tb);
    $display("\t\tTime\tSelect\tIn\tOut");
    $monitor($time, "\t%b\t%b\t%b", sel, in, out);
    #5 in = 3'b 010; sel = 2'b00;
    #5 sel = 2'b01;
    #5 sel = 2'b10;
    #5 sel = 2'b11;
    #5 in = 3'b101; sel = 2'b00;
    #5 sel = 2'b01;
    #5 sel = 2'b10;
    #5 sel = 2'b11;
    #10 $finish;
end

endmodule