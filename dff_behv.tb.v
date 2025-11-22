`timescale 1ns/1ps
`include "dff_behv.v"

module dff_behv_tb;
reg D, en, clk, reset;
wire Qlatch, Qff;

d_latch dut1(.D(D), .en(en), .Q(Qlatch));
dff dut2(.D(D), .clk(clk), .reset(reset), .Q(Qff));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dff_behv.vcd");
    $dumpvars(0,dff_behv_tb);
    $display("\t\tTime\tD\tQ_latch\tQ_ff");
    $monitor($time, "\t%b\t%b\t%b", D, Qlatch, Qff);
    reset = 0; D = 0; en = 0; 
    #10 reset = 1;
    #10 D = 0;
    #10 en = 1;
    #10 D = 1;
    #10 en = 0;
    #10 D = 1;
    #10 en = 1;
    #10 reset = 0;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 D = 1;
    #50 $finish;
end
endmodule

