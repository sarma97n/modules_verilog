`timescale 1ns/1ps
`include "cla_adder.v"

module cla_adder_tb;
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Carry;

cla_adder dut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Carry(Carry));

initial begin
    $dumpfile("cla_adder.vcd");
    $dumpvars(0,cla_adder_tb);
    $display("\t\tTime\t\tA\tB\tCin\tSum\tCarry");
    $monitor($time, "\t\t%b\t%b\t%b\t%b\t%b", A, B,Cin, Sum, Carry);
    #5 A = 4'b0101; B = 4'b1010; Cin = 1'b0; 
    #5 Cin = 1'b1;
    #5 A = 4'b0011; B = 4'b1100; Cin = 1'b0;
    #5 Cin = 1'b1;
    #5 A = 4'b0000; B = 4'b1111; Cin = 1'b0;
    #5 Cin = 1'b1;
    #10 $finish;
end
endmodule