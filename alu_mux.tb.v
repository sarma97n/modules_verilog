`timescale 1ns/1ps
`include "alu_mux.v"

module alu_mux_tb;
reg A,B,C;
wire HSum, HCarry;
wire FSum, FCarry;
wire HDiff, HBorrow;
wire FDiff, FBorrow;

halfadder dut1(.A(A), .B(B), .Sum(HSum), .Carry(HCarry));
fulladder dut2(.A(A), .B(B), .Cin(C), .Sum(FSum), .Carry(FCarry));
halfsub dut3(.A(A), .B(B), .Diff(HDiff), .Borrow(HBorrow));
fullsub dut4(.A(A), .B(B), .C(C), .Diff(FDiff), .Borrow(FBorrow));

integer i;

initial begin
    $dumpfile("alu_mux.vcd");
    $dumpvars(0,alu_mux_tb);
    $display("\t\tTime\tA\tB\tC\tHSum\tHCarry\tFSum\tFCarry\tHDiff\tHBorrow\tFDiff\tFBorrow");
    $monitor($time, "\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", A,B,C,HSum,HCarry,FSum,FCarry,HDiff,HBorrow,FDiff,FBorrow);
    for (i = 0; i < 8; i++) begin
        {A,B,C} = i;
        #5;
    end
    #5 $finish;
end

endmodule
