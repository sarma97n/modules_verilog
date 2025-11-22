module edge_detector(
    input clk, reset,
    output reg [7:0] pos_edge, neg_edge
);

reg w;

always @(posedge clk or negedge clk or posedge reset) begin
    if (reset) begin
        pos_edge <= 0;
        neg_edge <= 0;
        w = 0;
    end
    else begin
        if (clk == 1 && w == 0) begin
            pos_edge = pos_edge + 1;
        end
        if (clk == 0 && w == 1) begin
            neg_edge = neg_edge + 1;
        end
        w <= clk;
    end
end
endmodule