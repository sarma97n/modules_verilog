`timescale 1ns/1ps
`include "mod5_counter.v"

module mod5_counter_tb;
reg clk, reset;
wire [2:0] Q;

mod5_counter dut(.clk(clk), .reset(reset), .Q(Q));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("mod5_counter.vcd");
    $dumpvars(0,mod5_counter_tb);
    $display("\t\tTime\treset\tOutput");
    $monitor($time, "\t%b\t%b", reset, Q);
    reset = 1;
    #10 reset = 0;
    #100 $finish;
end
endmodule