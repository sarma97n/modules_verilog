module segment7_ascii(
    input [6:0] seg,
    output reg [7:0] ascii
);

always @(*) begin
    case (seg) 
        7'b0111111 : ascii = 8'h30;
        7'b0000110 : ascii = 8'h31;
        7'b1011011 : ascii = 8'h32;
        7'b1001111 : ascii = 8'h33;
        7'b1100110 : ascii = 8'h34;
        7'b1101101 : ascii = 8'h35;
        7'b1111101 : ascii = 8'h36;
        7'b0000111 : ascii = 8'h37;
        7'b1111111 : ascii = 8'h38;
        7'b1101111 : ascii = 8'h39;
    endcase
end
endmodule