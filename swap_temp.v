module swap_temp;
reg [7:0]a,b,temp;

initial begin
    a=8'b01010101;
    b=8'b11111111;

    $display("Before swap a=%d , b=%d", a,b);

    temp=a;
    a=b;
    b=temp;

    $display("After swap a=%d, b=%d", a,b);
end

endmodule