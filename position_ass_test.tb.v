`timescale 1ns / 1ps
`include "position_asso_test.v"

module position_ass_test_tb;
    reg X1,X2,X3,X4,X5,X6;
    wire OUT;
    position_asso_test dut (X1,X2,X3,X4,X5,X6,OUT);
        initial begin
            $dumpfile("position_aso_test.vcd");
            $dumpvars(0,position_ass_test_tb);
            $monitor($time,"X1=%b,X2=%b,X3=%b,X4=%b,X5=%b,X6=%b,OUT=%b",X1,X2,X3,X4,X5,X6,OUT);
            #5 X1=1;X2=0;X3=0;X4=1;X5=0;X6=1;
            #5 X1=0; X3=1;
            #5 X1=1; X3=0;
            #5 X6=1;
            #5 $finish;
        end
endmodule