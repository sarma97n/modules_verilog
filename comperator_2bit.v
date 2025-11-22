module comperator_2bit(great, less, equal, a, b);
input a, b;
output reg great, less, equal;

always @(*) begin
    great = a & ~b;
    less = ~a & b;
    equal = (a & b) | (~a & ~b);
end
endmodule
