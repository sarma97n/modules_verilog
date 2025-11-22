module dff_syn(
    input D, clk, reset,
    output reg Q
);

always @(posedge clk) begin
    if (reset) Q <=1'b0;
    else Q <= D;
end
endmodule

module dff_asyn(
    input D, clk, reset, 
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset) Q <=  1'b0;
    else Q <= D;
end
endmodule