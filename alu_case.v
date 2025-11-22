module alu_operation_selector;
reg [1:0]opcode;
reg [7:0]A=10,B=5;
reg [7:0]result;
initial begin
	opcode = 2'b00; //Set opcode to 01 (substraction)
		case(opcode)
		2'b00: result=A+B; //Addition
		2'b01: result=A-B; //substraction
		2'b10: result=A*B; //Multiplication
		default: result=0; //Default 
		endcase
	$display("Result of operation: %d",result); //Display result of operaiton
	end
	endmodule