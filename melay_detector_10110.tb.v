`include "melay_detector_10110.v"

module melay_detector_10110_tb;
reg x, clk, reset;
wire z;

melay_detector_10110 dut(.x(x), .clk(clk), .reset(reset), .z(z));

always #10 clk = ~clk;

initial begin
    $dumpfile("melay_detector_10110_tb.vcd");
    $dumpvars(0,melay_detector_10110_tb);
    clk = 1;
    reset = 1'b1;
    #15 reset = 1'b0;
    x=0;
    repeat (100) #10 x = $random;
    #100 $finish;
end
endmodule