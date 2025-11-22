`timescale 1ns/1ps
`include "full_adder.v"
module full_adder_tb;
reg a,b,c;
wire s,ca;

full_adder dut(a,b,c,s,ca);
reg [3:0]i;
initial begin
    $display("a\tb\tc\t Sum\tCarry");
    $dumpfile("full_adder.tb.vcd");
    $dumpvars(0, full_adder_tb);

    for (i=0; i<8; i=i+1) begin
        {a,b,c}=i;
        #1;
        $display("%b\t%b\t%b\t %b\t%b",a,b,c,s,ca);
    end
    $finish;
end

endmodule
