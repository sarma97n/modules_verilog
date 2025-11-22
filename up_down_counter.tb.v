`timescale 1ns/1ps
`include "up_down_counter.v"

module up_down_counter_tb;
reg clk, reset, mode;
wire [3:0] count;

up_down_counter dut(.clk(clk), .reset(reset), .mode(mode), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0,up_down_counter_tb);
    $display("\t\tTIme\tmode\treset\tcount");
    $monitor($time, "\t%b\t%b\t%d", mode, reset, count);
    reset = 0; mode = 0;
    #10 reset = 1;
    #10 mode = 1;
    #10 reset = 0;
    #100 reset = 1;
    #10 mode = 0;
    #10 reset = 0;
    #100 reset = 1;
    $finish;
end
endmodule