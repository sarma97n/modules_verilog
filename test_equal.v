module test_equal;
reg [1:0] a,b,c,d;

initial begin
    a=2'b10;
    b=2'b1x;
    c=2'b10;
    d=2'b1x;

    $display("%b==%b => %b",a,b,(a==b));
    $display("%b===%b => %b",a,b,(a===b));
    $display("%b==%b => %b",a,c,(a==c));
    $display("%b===%b => %b",a,c,(a===c));
    $display("%b==%b => %b",b,d,(b==d));
    $display("%b===%b => %b",b,d,(b===d));
end
endmodule
