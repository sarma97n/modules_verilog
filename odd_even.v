module if_else;
reg [3:0]num=5;
initial begin
	if (num%2==0) begin
		$display("The number %d is even.",num);
	end
	else begin
		$display("The number %d is odd.",num);
	end
end
endmodule