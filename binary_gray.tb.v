`timescale 1ns/1ps
`include "binary_gray.v"

module binary_gray_tb;
reg [7:0]binary_in;
wire [7:0]gray_out;

binary_gray dut(.binary_in(binary_in), .gray_out(gray_out));

integer  i;

initial begin
    $dumpfile("binary_gray.vcd");
    $dumpvars(0,binary_gray_tb);
    $display("\t\t Time\tBinary\t\tGray Code");
    $monitor($time, "\t%b\t\t%b", binary_in, gray_out);
    for (i = 0; i < 16; i++) begin
        #5 binary_in = i;
    end
    $finish;
end
endmodule