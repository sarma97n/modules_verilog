`timescale 1ns/1ps
`include "bi_shift_reg.v"

module bi_shift_reg_tb;
reg clk, reset, Sin, dir;
wire [3:0]Q; 
wire Sout;

bi_shift_reg SR1(.clk(clk), .reset(reset), .Sin(Sin), .dir(dir), .Q(Q), .Sout(Sout));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("bi_shift_reg.vcd");
    $dumpvars(0,bi_shift_reg_tb);
    $display("\t\tTime\tSin\tDir\tQ\tSout");
    $monitor($time, "\t%b\t%b\t%b\t%b",Sin, dir, Q, Sout);
    reset = 1; Sin = 0; dir = 1;
    #10 reset = 0;
    #10 Sin = 1;
    #10 Sin = 0;
    #10 Sin = 1;
    #10 Sin = 1;
    #10 dir = 0; Sin = 0;
    #50;
    $finish;
end
endmodule