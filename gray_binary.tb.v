`timescale 1ns/1ps
`include "gray_binary.v"

module gray_binary_tb;
reg [7:0]gray_in;
wire [7:0]binary_out;

gray_binary dut(.gray_in(gray_in), .binary_out(binary_out));

integer i;

initial begin
    $dumpfile("gray_binary.vcd");
    $dumpvars(0,gray_binary_tb);
    $display("\t\tTime\tGray code\tBinary");
    $monitor($time, "\t%b\t%b", gray_in, binary_out);
    for (i = 0; i < 16; i++) begin
        #5 gray_in = i;
    end
    $finish;
end
endmodule