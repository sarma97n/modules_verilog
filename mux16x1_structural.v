module mux4x1(in,sel,out);
input [3:0] in;
input [1:0] sel;
output out;
assign out = in[sel];
endmodule

module mux16x1_structural (in,sel,out);
    input [15:0] in;
    input [3:0] sel;
    output out;
    wire [3:0]t;
    mux4x1 mux1(in[3:0],sel[1:0],t[0]);
    mux4x1 mux2(in[7:4],sel[1:0],t[1]);
    mux4x1 mux3(in[11:8],sel[1:0],t[2]);
    mux4x1 mux4(in[15:12],sel[1:0],t[3]);
    mux4x1 mux5(t,sel[3:2],out);
endmodule