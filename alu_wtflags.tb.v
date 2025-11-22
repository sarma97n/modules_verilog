`timescale 1ns/1ps
`include "alu_wtflags.v"

module alu_wtflags_tb;
reg [7:0] A,B;
reg [1:0] opcode;
wire OF, ZF, SF, PF;
wire [7:0] C;

alu_wtflags dut(.C(C), .OF(OF), .ZF(ZF), .SF(SF), .PF(PF), .A(A), .B(B), .opcode(opcode));

initial begin 
    $dumpfile("alu_wtflags.tb.vcd");
    $dumpvars(0,alu_wtflags_tb);
    $display("\t\t Time\t  A\t\t    B  \t    Opcode\tOF\tZF\tSF\tPF\tC");
    $monitor($time, "\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",A,B,opcode,OF,ZF,SF,PF,C);
    #5 A = 8'b00001111; B = 8'b11110000; opcode = 2'b00;
    #5 opcode = 2'b01;
    #5 opcode = 2'b10;
    #5 opcode = 2'b11;
    #5 A = 8'b01010101; B = 8'b10101010; opcode = 2'b00;
    #5 opcode = 2'b01;
    #5 opcode = 2'b10;
    #5 opcode = 2'b11;
    #5 $finish;
end
endmodule
