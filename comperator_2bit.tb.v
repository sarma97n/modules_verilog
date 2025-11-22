`timescale 1ns/1ps
`include "comperator_2bit.v"

module comperator_2bit_tb;
reg a, b;
wire great, less, equal;

comperator_2bit dut(.a(a), .b(b), .great(great), .less(less), .equal(equal));

initial begin
    $dumpfile("comperator_2bit.tb.vcd");
    $dumpvars(0,comperator_2bit_tb);
    $display("\t\tTime\ta\tb\tgreat\tless\tequal");
    $monitor($time, "\t%b\t%b\t%b\t%b\t%b",a,b,great,less,equal);
    #5 {a,b} = 2'b00;
    #5 {a,b} = 2'b01;
    #5 {a,b} = 2'b10;
    #5 {a,b} = 2'b11;
    #5 $finish;
end
endmodule
