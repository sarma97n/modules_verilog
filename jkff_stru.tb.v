/*`timescale 1ns/1ps
`include "jkff_stru.v"

module jkff_stru_tb;
reg J,K,clk;
wire Q,Qbar;

jkff_stru dut(.J(J), .K(K), .clk(clk), .Q(Q), .Qbar(Qbar));

integer i;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("jkff_stru.vcd");
    $dumpvars(0, jkff_stru_tb);
    $display("\t\tTime\tJ\tK\tQ\tQbar");
    $monitor($time, "\t%b\t%b\t%b\t%b", J,K,Q,Qbar);
    J = 0; K = 0; 
    #5;
    for (i = 0; i < 4; i++) begin
        {J,K} = i;
        @(posedge clk);`timescale 1ns/1ps
        #5;
    end
    #5 $finish;
end
endmodule
*/

`timescale 1ns/1ps
`include "jkff_stru.v"

module jkff_stru_tb;
reg J,K,clk,reset;
wire Q,Qbar;

jkff_stru dut(.J(J), .K(K), .clk(clk), .reset(reset), .Q(Q), .Qbar(Qbar));

integer i;

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("jkff_stru.vcd");
    $dumpvars(0,jkff_stru_tb);
    $display("\t\tTime\tJ\tK\tQ\tQbar");
    $monitor($time, "\t%b\t%b\t%b\t%b",J,K,Q,Qbar);
    reset = 1; J = 0; K = 0; 
    #5 reset = 0;
    for (i=0; i<4; i++) begin
        {J,K} = i;
        @(posedge clk);
        #5;
    end
    #5 $finish;
end
endmodule
