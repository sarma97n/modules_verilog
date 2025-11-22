`timescale 1ns / 1ps
`include "encoder_if.v"

module encoder_if_tb;

reg enable;
reg [15:0]encoder_in;
wire [3:0]binary_out;

encoder_if dut (
    .binary_out(binary_out),
    .encoder_in(encoder_in),
    .enable(enable)
);

initial begin
    $dumpfile("encoder_if.vcd");
    $dumpvars(0, encoder_if_tb);

    $display("___________________________________________");
    $display(" Time  |   Enable   |   encoder_in    | binary_out");
    $display("___________________________________________");

    enable = 0;
    encoder_in = 16'h0000;
    #10;
    $display("%4t |    %b    | %16b |    %d", $time, enable, encoder_in, binary_out);

    enable = 1;
        encoder_in = 16'h0001;
        #10;
        $display("%4t  |    %b    | %16b |    %d", $time, enable, encoder_in, binary_out);
    
    enable = 1;
        encoder_in = 16'h0010;
        #10;
        $display("%4t  |    %b    | %16b |    %d", $time, enable, encoder_in, binary_out);

    enable = 1;
        encoder_in = 16'h0100;
        #10;
        $display("%4t  |    %b    | %16b |    %d", $time, enable, encoder_in, binary_out);

    enable = 1;
        encoder_in = 16'h1000;
        #10;
        $display("%4t  |    %b    | %16b |    %d", $time, enable, encoder_in, binary_out);

    $display("___________________________________________");
    $finish;
end

endmodule