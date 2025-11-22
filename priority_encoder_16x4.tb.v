`timescale 1ns/1ps
`include "priority_encoder_16x4.v"

module priority_encoder_16x4_tb;
reg [15:0]D;
wire [3:0]Y;

integer j;

priority_encoder_16x4 dut(.D(D), .Y(Y));

initial begin
    $dumpfile("priority_encoder_16x4.vcd");
    $dumpvars(0,priority_encoder_16x4_tb);
    $display("\t\tTime\t\tInput\t\tOutput");
    for (j = 0; j < 16; j++) begin
        $monitor($time, "\t %b\t%b",D,Y);
        D = 16'b0;
        D[j] = 1'b1;
        #5;
    end
    #5 $finish;
end
endmodule