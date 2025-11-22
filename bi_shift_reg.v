module dff(
    input clk, reset, D,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if(reset) Q <= 1'b0;
    else Q <= D;
end
endmodule

module bi_shift_reg(
    input clk, reset, Sin, dir,
    output [3:0]Q, 
    output Sout
);

wire [3:0]d;

assign d[3] = (dir) ? Sin : Q[1];
assign d[2] = (dir) ? Q[3]: Q[1];
assign d[1] = (dir) ? Q[2]: Q[0];
assign d[0] = (dir) ? Q[1]: Sin;

dff df1(.clk(clk), .reset(reset), .D(d[0]), .Q(Q[0]));
dff df2(.clk(clk), .reset(reset), .D(d[1]), .Q(Q[1]));
dff df3(.clk(clk), .reset(reset), .D(d[2]), .Q(Q[2]));
dff df4(.clk(clk), .reset(reset), .D(d[3]), .Q(Q[3]));

assign Sout = (dir) ? Q[0] : Q[3];

endmodule