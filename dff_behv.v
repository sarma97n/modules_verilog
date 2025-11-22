module d_latch(
    input wire D, en,
    output reg Q
);

always @(*) begin
    if (en) Q = D;
    else Q = Q;  
end

endmodule

module dff(
    input D, clk, reset,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset) Q <= 1'b0;
    else Q <= D;
end

endmodule