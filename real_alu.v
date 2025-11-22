module real_alu;
real a,b;
real sum, diff, mul, div;

initial begin
    a=25.25;
    b=5.25;

    sum = a + b;
    diff = a - b;
    mul = a * b;
    div = a / b;

    $monitor($time, "a=%f,b=%f \n sum=%f,difference=%f,multiplication=%f,division=%f", a,b,sum,diff,mul,div);

    $finish;
end
endmodule