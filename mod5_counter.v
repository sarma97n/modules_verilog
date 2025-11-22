module dff(
    input clk, reset, D,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if(reset) Q <= 0;
    else Q <= D;
end
endmodule

module mod5_counter(
    input clk, reset,
    output [2:0]Q
);

wire [2:0]D;

assign D[2] = Q[0] | (~Q[1] & ~Q[2]) | (Q[1] & Q[2]);
assign D[1] = ~Q[1] & Q[2];
assign D[0] = ~Q[1] & ~Q[2];

dff DF1(.clk(clk), .reset(reset), .D(D[0]), .Q(Q[0]));
dff DF2(.clk(clk), .reset(reset), .D(D[1]), .Q(Q[1]));
dff DF3(.clk(clk), .reset(reset), .D(D[2]), .Q(Q[2]));

endmodule