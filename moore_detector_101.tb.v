`include "moore_detector_101.v"

module moore_detector_101_tb;
reg x, clk, reset;
wire z;

moore_detector_101 dut(.x(x), .clk(clk), .reset(reset), .z(z));

always #10 clk = ~clk;

initial begin
    $dumpfile("moore_detector_101_tb.vcd");
    $dumpvars(0,moore_detector_101_tb);
    clk = 1;
    reset = 1'b1;
    #15 reset = 1'b0;
    x=0;
    repeat (100) #10 x = $random;
    #100 $finish;
end
endmodule