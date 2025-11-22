/*
module melay_detector_10110(
    input clk,rst,x,
    output pattern_det
);

parameter IDLE = 0,
S1=1,
S10=2,
S101=3,
S1011=4,
S10110=5;

reg [2:0]pre_state,next_state;

assign pattern_det = pre_state == S10110 ? 1:0;

always @(posedge clk) begin
    if (rst===1'b1) begin
        pre_state <= S1;
    end
    else  begin
        pre_state <= next_state;
    end
end

always @(pre_state or x) begin
    case (pre_state)
    S1: begin
        if (x == 1'b1)
        next_state <= S10;
        else
        next_state <= S1;
    end
    S10: begin
        if (x == 1'b0)
        next_state <= S101;
        else
        next_state <= S10;
    end
    S101: begin
        if (x == 1'b1)
        next_state <= S1011;
        else
        next_state <= S1;
    end
    S1011: begin
        if (x == 1'b1)
        next_state <= S1011;
        else
        next_state <= S101;
    end
    S10110: begin
        if (x == 1'b0)
        next_state <= S10110;
        else 
        next_state <= S10;
    end
    default: begin
        next_state <= S1;
    end
    endcase
end
endmodule     
*/
module melay_detector_10110(
    input x,clk,reset,
    output reg z
);
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    reg [2:0] PS,NS;

    always @(posedge clk) begin
        if (reset)
        PS <= S0;
        else 
        PS <= NS;
    end

    always @(posedge clk) begin
        if (reset)
        z <= 1'b0;
        else
        z <= (PS == S4) && (!x);
    end

    always @(*) begin
        case (PS)
            S0 : NS = x ? S1 : S0;
            S1 : NS = x ? S1 : S2;
            S2 : NS = x ? S3 : S0;
            S3 : NS = x ? S4 : S2;
            S4 : NS = x ? S1 : S2;
            default : NS = S0;
        endcase
    end
endmodule