module swap_notemp;
reg [7:0]a,b;

initial begin
    a=8'b10101010;
    b=8'b11111111;

    $display("Before swap a=%d,b=%d",a,b);
    
    a=a^b;
    b=a^b;
    a=a^b;

    $display("After swap a=%d, b=%d",a,b);
end
endmodule