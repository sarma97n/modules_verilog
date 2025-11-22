`timescale 1ns/1ps
`include "16bit_adder.v"

module adder_test;
reg [15:0]X,Y;
wire [15:0]Z;
wire S,Zr,Cy,P,V;
adder dut(.X(X),.Y(Y),.Z(Z),.sign(S),.zero(Zr),.carry(Cy),.parity(P),.overflow(V));
initial begin
    $dumpfile("16bit_adder.vcd");
    $dumpvars(0,adder_test);
    $monitor($time,"X=%h,Y=%h,Z=%h,S=%b,Zr=%b,Cy=%b,P=%b,V=%b",X,Y,Z,S,Zr,Cy,P,V);
    #5 X=16'h8fff; Y=16'h8000;
    #5 X=16'hfffe; Y=16'h0002;
    #5 X=16'haaaa; Y=16'h5555;
    #5 $finish;
end
endmodule