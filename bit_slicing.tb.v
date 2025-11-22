`timescale 1ns/1ps
`include "bit_slicing.v"

module bit_slicing_tb;
reg [7:0] a,b;
wire [15:0] y;

bit_slicing dut(a,b,y);
initial begin 
    $monitor($time, "a=%b, b=%b, \t y=%b",a,b,y);

    #10 a=8'b00000000; b=8'b11111111;
    #10 a=8'b10101010; b=8'b01010101;
    #10 a=8'b11110000; b=8'b00001111;
    #10 $finish;
end
endmodule
