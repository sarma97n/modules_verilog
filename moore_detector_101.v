module moore_detector_101(
    input x, clk, reset,
    output reg z
);
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] PS, NS;

    always @(posedge clk) begin
        if (reset)
        PS <= S0;
        else
        PS <= NS;
    end

    always @(*) begin
        case (PS)
        S0 : NS = x ? S1 : S0;
        S1 : NS = x ? S1 : S2;
        S2 : NS = x ? S3 : S0;
        S3 : NS = x ? S1 : S2;
        default : NS = S0;            
        endcase
    end
    
    always @(PS) begin
        case (PS) 
        S3 : z = 1;
        default : z = 0;            
        endcase
    end
endmodule