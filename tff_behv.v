module tff_behv(
    input T,clk,reset,
    output reg Q =0
);

always @(posedge clk) begin
    if (reset) 
        Q <= 0;
    else if (T)
        Q <= ~Q;
end

endmodule