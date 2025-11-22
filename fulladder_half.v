module halfadder(
    input A,B,
    output Sum,Carry
);

xor G1(Sum,A,B);
and G2(Carry,A,B);
endmodule

module fulladder_half(
    input A,B,Cin,
    output Sum, Carry
);

wire S,C1,C2;

halfadder HF1(.Sum(S1), .Carry(C1), .A(A), .B(B));
halfadder HF2(.Sum(Sum), .Carry(C2), .A(S1), .B(Cin));
or G3(Carry, C1, C2);
endmodule