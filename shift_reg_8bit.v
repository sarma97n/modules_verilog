module dff_stru(
    input D, clk, reset,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset) Q <= 1'b0;
    else Q <= D;
end

endmodule

module shift_reg_8bit(
    input clk, reset, en, serial_in,
    output serial_out
);

integer i;

reg [7:0] w;
wire [7:0] q;

assign serial_out = q[0];

always @(posedge clk or posedge reset) begin
    if (en) begin
        w[7] <= serial_in;
        for (i = 0; i < 7; i++) begin
            w[i] = q[i+1];
        end
    end
    else w = q;
end

dff_stru dff1(.D(w[7]), .clk(clk), .reset(reset), .Q(q[7]));
dff_stru dff2(.D(w[6]), .clk(clk), .reset(reset), .Q(q[6]));
dff_stru dff3(.D(w[5]), .clk(clk), .reset(reset), .Q(q[5]));
dff_stru dff4(.D(w[4]), .clk(clk), .reset(reset), .Q(q[4]));
dff_stru dff5(.D(w[3]), .clk(clk), .reset(reset), .Q(q[3]));
dff_stru dff6(.D(w[2]), .clk(clk), .reset(reset), .Q(q[2]));
dff_stru dff7(.D(w[1]), .clk(clk), .reset(reset), .Q(q[1]));
dff_stru dff8(.D(w[0]), .clk(clk), .reset(reset), .Q(q[0]));

endmodule