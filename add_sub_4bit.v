/*module sum(S,C);

input x,y,z;
output S,C;

wire w1,w2,w3;

initial begin
    xor g1(S,x,y,z);
    and g2(w1,x,y);
    and g3(w2,y,z);
    and g4(w3,x,z);
    or g5(C,w1,w2,w3);
end

endmodule

module diff(D,B,x,y,z);

input x,y,z;
output D,B;

wire w4,w5,w6;

initial begin
    xor g6(D,x,y,z);
    and g7(w4,~x,y);
    and g8(w5,~x,z);
    and g9(w6,y,z);
    or g10(B,w4,w5,w6);
end

endmodule

module add_diff4;

input [3:0] x,y;
input mode;
output [3:0] S,D;
output C,B;

wire [3:0]w;

initial begin
    if (mode) begin
        sum s1(.S(S), .C(w[1]), .x(x[1]), .y(y[1]), .z(z[1]));
        sum s1(.S(S), .C(w[2]), .x(x[2]), .y(y[2]), .z(z[2]));
        sum s1(.S(S), .C(w[2]), .x(x[1]), .y(y[1]), .z(z[1]));
emd
*/

module full_adder(S,Cout,A,B,Cin);
input A,B,Cin;
output S,Cout;

wire w1,w2,w3;

xor G1(w1,A,B);
xor G2(S,w1,Cin);
and G3(w2,A,B);
and G4(w3,w1,Cin);
or G5(Cout,w2,w3);

endmodule

module add_sub_4bit(
input [3:0] A,B,
input mode,
output [3:0] S,
output Cout);

wire [3:0]w;
wire [3:0]C;

xor G6(w[0],mode,B[0]); 
xor G7(w[1],mode,B[1]);
xor G8(w[2],mode,B[2]);
xor G9(w[3],mode,B[3]);

full_adder FA1(S[0],C[0],A[0],w[0],mode);
full_adder FA2(S[1],C[1],A[1],w[1],C[0]);
full_adder FA3(S[2],C[2],A[2],w[2],C[1]);
full_adder FA4(S[3],C[3],A[3],w[3],C[2]);

endmodule