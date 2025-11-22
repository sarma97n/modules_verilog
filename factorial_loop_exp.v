module factorial_loop_exp;
reg i=1;
reg factorial=1;
reg [3:0]num = 4;

initial begin
	for (i=1;i<=num;i=i+1) begin	
		factorial = factorial*i;
	end
$diaplay("factorial of %d is %d',num,factorial");
end
endmodule
