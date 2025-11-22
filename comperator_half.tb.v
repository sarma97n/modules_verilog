`timescale 1ns/1ps
`include "comperator_half.v"

module comperator_half_tb;
reg [1:0] A, B;
wire equal, less, great;

comperator_half dut(.A(A), .B(B), .equal(equal), .less(less), .great(great));

integer i;

initial begin
    $dumpfile("comperator_half.vcd");
    $dumpvars(0,comperator_half_tb);
    $display("\t\tTIme\tA\tB\tA=B\tA<B\tA>B");
    $monitor($time, "\t%b\t%b\t%b\t%b\t%b", A, B, equal, less, great);
    for (i = 0; i < 16; i++) begin
        {A , B} = i;
        #5;
    end
    $finish;
end
endmodule