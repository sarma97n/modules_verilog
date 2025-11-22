`timescale 1ns/1ps
`include "updown_gray_counter.v"

module updown_gray_counter_tb;
reg clk, reset, mode;
wire [3:0] gray;

updown_gray_counter dut(.clk(clk), .reset(reset), .mode(mode), .gray(gray));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("updown_gray_counter.vcd");
    $dumpvars(0,updown_gray_counter_tb);
    $display("\t\tTime\tReset\tMode\tGray count");
    $monitor($time, "\t%b\t%b\t%b", reset, mode, gray);
    reset = 0; mode = 0;
    #10 reset = 1; mode = 1;
    #50 reset = 0;
    #50 reset = 1; mode = 0;
    #50 reset = 0;
    #50 $finish;
end
endmodule
