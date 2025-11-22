module cla_adder(
    input [3:0]A, B,
    input Cin,
    output [3:0]Sum,
    output Carry
);

wire [3:0] P,G;
wire [4:0] C;

assign C[0] = Cin;
assign P = A ^ B;
assign G = A & B;

assign C[1] = G[0] | (P[0] & C[0]);
assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

assign Sum = P ^ C[3:0];
assign Carry = C[4];

endmodule