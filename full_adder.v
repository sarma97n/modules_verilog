module full_adder (a,b,c,s,ca);
input a,b,c;
output reg s,ca;

always@(*) begin
    {ca,s}=a+b+c;
end

endmodule