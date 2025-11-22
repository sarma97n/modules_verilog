`timescale 1ns/1ps
`include "ring_counter4bit.v"

module ring_counter4bit_tb;
reg clk, reset;
wire [3:0] count;

ring_counter4bit dut(.clk(clk), .reset(reset), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("ring_counter4bit.vcd");
    $dumpvars(0,ring_counter4bit_tb);
    $display("\t\tTime\treset\tCount");
    $monitor($time, "\t%b\t%b", reset, count);
    #10 reset = 1; 
    #50 reset = 0;
    #50 reset = 1;
    $finish;
end
endmodule