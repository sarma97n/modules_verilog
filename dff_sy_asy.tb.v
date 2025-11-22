`timescale 1ns/1ps
`include "dff_sy_asy.v"

module dff_sy_asy_tb;
reg D, clk, reset;
wire Q;

dff_syn dut1(.D(D), .clk(clk), .reset(reset), .Q(Q));
dff_asyn dut2(.D(D), .clk(clk), .reset(reset), .Q(Q));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dff_sy_asy.vcd");
    $dumpvars(0,dff_sy_asy_tb);
    $display("\t\tTime\tReset\tD\tQ");
    $monitor($time, "\t%b\t%b\t%b",  reset, D, Q);
    reset = 0; D = 0; 
    #10 D = 1;
    #10 reset = 1; D =0;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 reset = 0; D = 0;
    #10 D = 1;
    #10 D = 1;
    #50 $finish;
end
endmodule