`timescale 1ns/1ps
`include "srff_behv.v"

module srff_behv_tb;
reg S,R,clk;
wire Q;

srff_behv dut(.S(S), .R(R), .clk(clk), .Q(Q));

integer i;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("srff_behv.vcd");
    $dumpvars(0,srff_behv_tb);
    $display("\tTime\tS\tR\tQ");
    $monitor($time, "\t%b\t%b\t%b",S,R,Q);
    for (i = 0; i < 4; i++) begin
        {S,R} = i;
        #10;
    end
    #10 $finish;
end
endmodule