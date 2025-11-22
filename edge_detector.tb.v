`timescale 1ns/1ps
`include "edge_detector.v"

module edge_detector_tb;
    reg clk, reset;
    wire [7:0] pos_edge, neg_edge;

edge_detector dut(.clk(clk), .reset(reset), .pos_edge(pos_edge), .neg_edge(neg_edge));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("edge_detector.vcd");
    $dumpvars(0,edge_detector_tb);
    $display("\t\t Time\treset\tPos edge count\tNeg edge count");
    $monitor($time, "\t%b\t\t%d\t\t%d",reset, pos_edge, neg_edge);
    reset = 0; 
    #5 reset = 1;
    #50 reset = 0;
    #50 $finish;
end

endmodule