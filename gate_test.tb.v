`timescale 1ns/1ps
`include "gate_test.v"

module gate_test_tb;
    reg A,B,C,D,E,F;
    wire Y;
    gate_test DUT(A,B,C,D,E,F,Y);
    initial begin
        $dumpfile("gate_test.vpp");
        $dumpvars(0, gate_test_tb);
        $monitor($time,"A=%b,B=%b,C=%b,D=%d,E=%b,F=%b,Y=%b",A,B,C,D,E,F,Y);
        #5 A=1; B=0; C=0; D=1; E=0; F=0;
        #5 A=0; B=0; C=1; D=1; E=0; F=0;
        #5 A=1; C=0;
        #5 F=1;
        #5 $finish;
    end
endmodule