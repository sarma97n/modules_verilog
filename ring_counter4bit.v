module dff(
    input clk, reset, D, in,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset) Q <= in;
    else Q <= D;
end
endmodule

module ring_counter4bit(
    input clk, reset, 
    output [3:0] count
);

wire [3:0] q;

assign q[0] = count[3];
assign q[1] = count[0];
assign q[2] = count[1];
assign q[3] = count[2];

dff df1(.clk(clk), .reset(reset), .D(q[0]), .in(1'b1), .Q(count[0]));
dff df2(.clk(clk), .reset(reset), .D(q[1]), .in(1'b0), .Q(count[1]));
dff df3(.clk(clk), .reset(reset), .D(q[2]), .in(1'b0), .Q(count[2]));
dff df4(.clk(clk), .reset(reset), .D(q[3]), .in(1'b0), .Q(count[3]));

endmodule