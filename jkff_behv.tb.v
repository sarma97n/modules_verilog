`timescale 1ns/1ps
`include "jkff_behv.v"

module jkff_behv_tb;
reg J,K,clk,reset;
wire Q;

jkff_behv dut(.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q));

integer i;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("jkff_behv.vcd");
    $dumpvars(0,jkff_behv_tb);
    $display("\t\tTime\tJ\tK\tQ");
    $monitor($time, "\t%b\t%b\t%b",J,K,Q);
    reset = 1; J = 0; K = 0; 
    #5 reset = 0;
    for (i=0; i<4; i++) begin
        {J,K} = i;
        #5;
    end
    #5 $finish;
end
endmodule