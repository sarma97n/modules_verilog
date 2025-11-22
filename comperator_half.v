module mux(
    input I0,I1,S,
    output out
);
assign out = (S) ? I1 : I0;

endmodule

module halfsub(
    input A,B,
    output Diff,Borrow
);

mux HSM1(.I0(A), .I1(~A), .S(B), .out(Diff));
and G3(Borrow, ~A, B);

endmodule

module comperator_half(
    input [1:0] A,B,
    output equal, less, great
);

wire [1:0] D, Bo;
wire [5:0] w;

halfsub HS1 (.Diff(D[0]), .Borrow(Bo[0]), .A(A[0]), .B(B[0]));
halfsub HS2 (.Diff(D[1]), .Borrow(Bo[1]), .A(A[1]), .B(B[1]));

and G1(equal, ~D[0], ~D[1]);

and G2(w[0], ~D[1], Bo[0]);
or G3(less, Bo[1], w[0]);

and G4(w[1], D[0],  ~D[1]);
and G5(w[2], w[1], ~Bo[0]);
and G6(w[3], D[1], ~Bo[1]);
or G7(great, w[3], w[2]);

endmodule