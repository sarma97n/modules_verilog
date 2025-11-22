`timescale 1ns/1ps
`include "oddeven_counter.v"

module oddeven_counter_tb;
reg clk, mode, reset;
wire [15:0]count;

oddeven_counter dut(.clk(clk), .reset(reset), .mode(mode), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("oddeven_counter.vcd");
    $dumpvars(0,oddeven_counter_tb);
    $display("\t\tTime\tMode\tReset\tCount");
    $monitor($time, "\t%b\t%b\t%d", mode, reset, count);
    reset = 1; mode = 1;
    #50 
    reset = 0;
    #100;
    reset = 1;
    mode = 0;
    #50;
    reset = 0;
    #100 $finish;
end
endmodule
