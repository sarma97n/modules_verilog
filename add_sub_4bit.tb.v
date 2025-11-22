`timescale 1ns/1ps
`include "add_sub_4bit.v"

module add_sub_4bit_tb;
reg [3:0]A,B;
reg mode;
wire [3:0]S;
wire Cout;

add_sub_4bit dut(.A(A),.B(B),.mode(mode),.S(S),.Cout(Cout));

initial begin 
    $dumpfile("add_sub_4bit.vcd");
    $dumpvars(0,add_sub_4bit_tb);
    $display("\t\tTime\tA\tB\tSum/Diff\tCarry/Borrow");

    $monitor($time, "\t%b\t%b\t%b\t\t%b", A,B,S,Cout);

    #5 A=4'b0011; B=4'b1100; mode = 1'b0;
    #5 mode = 1'b1;
    #5 A=4'b0101; B=4'b1010; mode = 1'b0;
    #5 mode = 1'b1;
    #5 A=4'b1111; B=4'b0001; mode = 1'b0;
    #5 mode = 1'b1;
    #5 $finish;
end
endmodule