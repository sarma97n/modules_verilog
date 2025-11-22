`timescale 1ns / 1ps
`include "mux16x1_behavoural.v"

module mux16x1_behavioural_tb;

    reg [15:0] A;
    reg [3:0] S;
    wire F;
    
    mux16x1_behavoural M(
        .in(A),
        .sel(S),
        .out(F)
    );
    
    initial begin
        $dumpfile("mux16x1_behavoural.vcd");
        $dumpvars(0, mux16x1_behavioural_tb);
    end
    
    initial begin
        $monitor($time,"A=%h,S=%h,F=%b",A,S,F);
        #5 A=16'h3F0A; S=4'h0;
        #5 S=4'h1;
        #5 S=4'h6;
        #5 S=4'hC;
        #5 $finish;
    end

endmodule