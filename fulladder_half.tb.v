`timescale 1ns/1ps
`include "fulladder_half.v"

module fulladder_half_tb;
reg A,B,Cin;
wire Sum, Carry;

fulladder_half dut(.Sum(Sum), .Carry(Carry), .A(A), .B(B), .Cin(Cin));

integer i;

initial begin 
    $dumpfile("fulladder_half.vcd");
    $dumpvars(0,fulladder_half_tb);
    $display("\t\tTime\tA\tB\tCin\tSum\tCarry");
    $monitor($time, "\t%b\t%b\t%b\t%b\t%b",A,B,Cin,Sum,Carry);

    for(i = 0; i < 8; i++) begin
        {A,B,Cin} = i;
        #5;
    end
    #5 $finish;
end
endmodule