`timescale 1ns/1ps
`include "dff.v"

module dff_tb;
reg d,clk,rst;
wire q,qbar;

dff dut (q,qbar,d,rst,clk);

always #5 clk=~clk;
always #6 d=~d;

initial begin
    $monitor($time, "clk = %b d = %b rst = %b q= %b qbar= %b", clk,d,rst,q,qbar);
    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb);
    clk = 0;
    rst = 0;
    #10 rst = 1;
    d = 0;
    #50 $finish;
end
endmodule