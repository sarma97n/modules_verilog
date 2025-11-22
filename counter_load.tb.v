`timescale 1ns/1ps
`include "counter_load.v"

module counter_load_tb;
parameter N = 4;
reg clk, reset, load;
reg [N-1:0]load_value;
wire [N-1:0]count;

counter_load #(N)dut(.clk(clk), .reset(reset), .load(load), .load_value(load_value), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("counter_load.vcd");
    $dumpvars(0,counter_load_tb);
    $display("\t\tTime\treset\tLoad\tLoad Value\tCount");
    $monitor($time, "\t%b\t%b\t%b\t\t%b",reset, load, load_value, count);
    reset = 1; load = 0; load_value=4'b0000;
    #10 reset = 0; load = 1; load_value = 4'b0101;
    #50 reset = 1;
    #50 reset = 0; load = 0;
    #50 reset = 1;
    #50 $finish;
end
    
endmodule