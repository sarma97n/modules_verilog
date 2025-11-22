`timescale 1ns/1ps
`include "bus_switch.v"

module bus_switch_tb;
reg clk, resetn;
reg valid;
reg [7:0] addr_in;
reg [15:0] data_in;
wire [7:0] addr_out_a, addr_out_b;
wire [15:0] data_out_a, data_out_b;

bus_switch dut(.clk(clk), .resetn(resetn), .valid(valid), .addr_in(addr_in), .data_in(data_in), .addr_out_a(addr_out_a), .data_out_a(data_out_a), .addr_out_b(addr_out_b), .data_out_b(data_out_b));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("bus_switch.vcd");
    $dumpvars(0,bus_switch_tb);
    $display("\t\tTIme\tvalid\taddr_in\t\tdata_in\taddr_out_a\tdata_out_a\taddr_out_b\tdata_out_b");
    $monitor($time, "\t%b\t%b\t%h\t\t%h\t\t%h\t\t%h\t%h", valid, addr_in, data_in, addr_out_a, data_out_a, addr_out_b, data_out_b);
    resetn = 0; valid = 0; addr_in = 0; data_in = 0;
    #10 resetn = 1;
    #10 valid = 1; addr_in = 8'h10; data_in =16'h1234 ;
    #10 valid = 0;
    #10 valid = 1; addr_in = 8'h40; data_in = 16'h4321;
    #10 valid = 0; 
    #10 valid = 1; addr_in = 8'hAA; data_in = 16'hAAAA;
    #50 $finish;
end
endmodule