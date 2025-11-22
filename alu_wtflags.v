module alu_wtflags(C,OF,ZF,SF,PF,A,B,opcode);
input [7:0] A,B;
input [1:0] opcode;
output reg OF, ZF, SF, PF;
output reg [7:0] C;



always @(*) begin
    case (opcode)
        2'b00: begin
            C = A + B; 
            OF = (A[7] & B[7] & ~C[7]) | (~A[7] & ~B[7] & C[7]);
        end
        2'b01: begin 
            C = A - B; 
            OF = (A[7] & B[7] & ~C[7]) | (~A[7] & ~B[7] & C[7]);
        end
        2'b10: begin
            C = A & B; 
            OF = 0;
        end
        2'b11: begin
            C = A | B; 
            OF = 0;
        end 
    endcase

    ZF = ~|C;
    SF = C[7];
    PF = ~^C;
end
endmodule