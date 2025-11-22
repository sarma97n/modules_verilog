`timescale 1ns/1ps
`include "johnson_4bit.v"

module johnson_4bit_tb;
reg clk, reset;
wire [3:0]count;

johnson_4bit dut(.clk(clk), .reset(reset), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("johnson_4bit.vcd");
    $dumpvars(0,johnson_4bit_tb);
    $display("\t\tTime\treset\tCount");
    $monitor($time, "\t%b\t%b",reset, count);
    reset = 1;
    #5 reset = 0;
    #100;
    $finish;
end
endmodule