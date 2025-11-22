module reverse_num;
integer num, rev, rem;

initial begin
    num = 1234;
    rev = 0;

    $display("original number = %d", num);

    while (num !=0) 
    begin
        rem = num % 10;
        rev = (rev * 10) + rem;
        num = num / 10;
    end
    $display("Reversed number = %d", rev);
end
endmodule
