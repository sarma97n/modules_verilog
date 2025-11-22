`timescale 1ns / 1ps
`include "expilicit_ass_test.v"

module expilict_ass_test_tb;
reg X1,X2,X3,X4,X5,X6;
wire OUT;

explicit_ass_test dut(.A(X1),.B(X2),.C(X3),.D(X4),.E(X5),.F(X6),.Y(OUT));

initial begin
    $dumpfile("expilicit_ass_test.vcd");
    $dumpvars(0,expilict_ass_test_tb);
end

initial begin
    $monitor($time,"X1=%b,X2=%b,X3=%b,X4=%b,X5=%b,X6=%b,OUT=%b",X1,X2,X3,X4,X5,X6,OUT);
    #5 X1 = 0; X2 = 0; X3 = 0; X4 = 0; X5 = 0; X6 = 0;
    #5 X1=0; X3=1;
    #5 X1=1; X3=0;
    #5 X6=1; 
    #5 $finish;
end

endmodule