`timescale 1ns/1ps
`include "clk_gen.v"

module clk_gen_tb;
    wire clk;
    clk_gen uut (.clk(clk));

    initial begin
        $dumpfile("clk_gen.vcd");
        $dumpvars(0, clk_gen_tb);
        #100 $display("Done: clk toggled for 100 time units"); // adjust duration
        $finish;
    end
endmodule