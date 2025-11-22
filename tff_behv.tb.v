`timescale 1ns/1ps
`include "tff_behv.v"

module tff_behv_tb;
reg T,clk,reset;
wire Q;

tff_behv dut(.T(T), .clk(clk), .reset(reset), .Q(Q));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("tff_behv.vcd");
    $dumpvars(0,tff_behv_tb);
    $display("\t\tTime\tT\tReset\tQ");
    $monitor($time, "\t%b\t%b\t%b", T,reset,Q);
    reset = 1; T = 0;
    #10 reset = 0; 
    #10 T = 0;
    #10 T = 1;
    #10 T = 0;
    #5 $finish;
end
endmodule