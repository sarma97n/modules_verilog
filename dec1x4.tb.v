`timescale 1ms / 1ps
`include"dec1x4.v"

module dec_tb;
reg in;
reg [1:0]s;
wire [3:0]out;
dec1x4 dut(.in(in),.sel(s),.out(out));
initial begin
    $dumpfile("dec4x1.vcd");
    $dumpvar(0,dec_tb);
    $monitor($time "s=%b,s=%b,out=%b",in,s,out);
    #5 s=1'b0; in=0;
    #5 s=1'b0; in=5;
    #5 s=1'b1; in=2;
    #5 s=1'b1; in=6;
    #5 $finish;
end
endmodule 