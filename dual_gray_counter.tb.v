`timescale 1ns/1ps
`include "dual_gray_counter.v"

module dual_gray_counter_tb;
reg clk, reset;
wire [3:0] gray_4;
wire [2:0] gray_3;

dual_gray_counter dut(.clk(clk), .reset(reset), .gray_4(gray_4), .gray_3(gray_3));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dual_gray_counter.vcd");
    $dumpvars(0,dual_gray_counter_tb);
    $display("\t\tTime\treset\tGray_4\tGray_3");
    $monitor($time, "\t%b\t%b\t%b", reset, gray_4, gray_3);
    reset = 0;
    #10 reset = 1;
    #50 reset = 0;
    #50 $finish;
end
endmodule