module data_types;
reg [3:0] reg_unsigned;
reg signed [7:0] reg_signed;
real real_number;
reg [8*11:0] a_string;
reg [7:0]memory[63:0];

initial begin
    reg_unsigned=4'b0101;
    reg_signed=-8'd25;
    real_number=32.65;
    a_string="PRS SEMICON";
    memory[0]=8'b01010101;
    memory[63]=8'b10101010;

    $display("reg_unsigned=%d \n reg_signed=%d \n real_number=%f \n a_string=%s \n memory[0]=%d, memory[63]=%d",reg_unsigned,reg_signed,real_number,a_string,memory[0],memory[63]);
end
endmodule
