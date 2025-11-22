`timescale 1ns/1ps
`include "shift_reg_8bit.v"

module shift_reg_8bit_tb;
reg clk, en, reset, serial_in;
wire serial_out;

shift_reg_8bit dut(.clk(clk), .en(en), .reset(reset), .serial_in(serial_in), .serial_out(serial_out));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("shift_reg_8bit.vcd");
    $dumpvars(0,shift_reg_8bit_tb);
    $display("\t\tTime\t\tserial in\tserial out");
    $monitor($time, "\t\t%b\t\t%b",serial_in,serial_out);
    reset = 1; en = 0; serial_in = 0;
    #10 reset = 0; en = 1;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 $finish;
end
    
endmodule