module test_shift;
reg [7:0] i1;
reg signed [7:0] i2;

initial begin
    i1=8'b00001111;
    $display($time, "\t initial value of i1= %b, \n logical right shift i1 by 4 bits = %b \n logical left shift i1 by 5 bits = %b", i1,(i1>>4),(i1<<5));

    i2=8'b11110000;
    $display($time, "\t initial value of i2=%b, \n arthematic right shift i2 by 4 bits = %b \n Arthematic left shift i2 by 7 bits = %b",i2,(i2>>>4),(i2<<<7));
end
endmodule 