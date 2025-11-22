`timescale 1ns/1ps
`include "segment7_ascii.v"

module segment7_ascii_tb;
reg [6:0] seg;
wire [7:0] ascii;

segment7_ascii dut(.seg(seg), .ascii(ascii));

initial begin
    $dumpfile("segment7_ascii.vcd");
    $dumpvars(0,segment7_ascii_tb);
    $display("\t\tTime\t7-Segment\tASCII");
    $monitor($time, "\t%b\t\t%h", seg, ascii);
    #5 seg = 7'b0111111;
    #5 seg = 7'b1111111;
    #5 seg = 7'b1001111;
    #10 $finish;
end
endmodule