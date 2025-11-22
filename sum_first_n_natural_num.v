module while_loop_exp;
integer i=1,sum=0;
reg[3:0]n=5;
initial begin
while (i<=n) begin
sum=sum+i;
i=i+1;
end
$display("Sum of first %d natural numbers is %d",n,sum);
end
endmodule