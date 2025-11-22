module contatenate;
reg [3:0] a,b,c,d;
reg [15:0] y;

initial begin
    a=4'b0101; b=4'b1010; c=4'b0000; d=4'b1111;
    y = {a,b,c,d};
    $display("a=%d,b=%d,c=%d,d=%d,  y=%h",a,b,c,d,y);
end
endmodule

