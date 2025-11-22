`timescale 1ns/1ps
`include "even_parity.v"

module even_parity_tb;
reg [2:0] data_in;
wire parity;
wire [3:0] out;

even_parity dut(.out(out), .parity(parity), .data_in(data_in));

initial begin
    $dumpfile("even_parity.tb.vcd");
    $dumpvars(0,even_parity_tb);
    $display("\t\tTime\tInput\tParity\tOutput");
    $monitor($time, "\t%b\t%b\t%b",data_in,parity,out);
    #5 data_in = 3'b000;
    #5 data_in = 3'b001;
    #5 data_in = 3'b010;
    #5 data_in = 3'b011;
    #5 data_in = 3'b100;
    #5 data_in = 3'b101;
    #5 data_in = 3'b110;
    #5 data_in = 3'b111;
    #5 $finish;
end
endmodule