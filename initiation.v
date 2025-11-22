module initiation;
reg a;
initial begin
a = 0;
a <= 1;
$display("a=%0b", a);
end
endmodule