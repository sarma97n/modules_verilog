module great_three;
reg [7:0]a,b,c;
reg [1:0]x;

initial begin
    a=8'd45; b=8'd15; c=8'd36;
    $display("the numbers are %d,%d,%d",a,b,c);

    x = a >= b ? 2'b00 : 2'b01;
    
    if (x == 2'b00)
        x = a >= c ? 2'b00 : 2'b10;
    else if (x == 2'b01)
        x = b >= c ? 2'b01 : 2'b10;

    case(x) 
        00:$display("The largest number among them is %d",a);
        01:$display("The largest number among them is %d",b);
        10:$display("The largest number among them is %d",c);
        default:$display("could't assess the greatest number");
    endcase

    $finish;
end
endmodule