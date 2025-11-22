module mux(
    input I0,I1,S,
    output out
);

assign out = (S) ? I0 : I1;

endmodule

module halfadder(
    input A,B,
    output Sum,Carry
);

mux HAM(.I0(A), .I1(~A), .S(B), .out(Sum));
and G1(Carry, A,B);
endmodule

module fulladder(
    input A,B,Cin,
    output Sum,Carry
);

wire w1,w2;

mux FAM1(.I0(A), .I1(~A), .S(B), .out(w1));
mux FAM2(.I0(w1), .I1(~w1), .S(Cin), .out(Sum));
and G2(w2, A, B);
mux FAM3(.I0(w2), .I1(Cin), .S(w1), .out(Carry));

endmodule

module halfsub(
    input A,B,
    output Diff,Borrow
);

mux HSM1(.I0(A), .I1(~A), .S(B), .out(Diff));
and G3(Borrow, ~A, B);

endmodule

module fullsub(
    input A,B,C,
    output Diff, Borrow
);

wire w1,w2;

mux FSM1(.I0(A), .I1(~A), .S(B), .out(w1));
mux FSM2(.I0(w1), .I1(~w1), .S(C), .out(Diff));
and G4(w2,~A,B);
mux FSM3(.I0(w2), .I1(C), .S(w1), .out(Borrow));

endmodule