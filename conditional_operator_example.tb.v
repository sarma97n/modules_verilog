`timescale 1ns/1ps
`include "conditional_operator_example.v"

module conditional_operator_example_tb;
reg [3:0] data_in;
wire [3:0] result;

conditional_operator_example dut(data_in,result);

initial begin
    $monitor($time, "data_in=%b (%d), result=%b (%d)", data_in,data_in,result,result);

    #10 data_in=4'b0000;
    #10 data_in=4'b1001;
    #10 data_in=4'b1010;
    #10 data_in=4'b0101;
    #10 $finish;
end
endmodule