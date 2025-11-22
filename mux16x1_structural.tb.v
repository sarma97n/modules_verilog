`timescale 1ns / 1ps
`include "mux16x1_structural.v"

module mux16x1_structural_tb();
    reg [15:0] A; reg [3:0]sel; wire F;
    mux16x1_structural M(.in(A), .sel(sel), .out(F));

    initial begin
        $dumpfile("mux16x1_structural.vcd");
        $dumpvars(0, mux16x1_structural_tb);
        $monitor("A = %h, sel = %h, F = %b", A, sel, F);
        #5 A=16'h3F0A; sel=4'h0;
        #5 sel=4'h1;
        #5 sel=4'h6;
        #5 sel=4'hA;
        #5 sel=4'hF;
        #5 $finish;
    end
endmodule