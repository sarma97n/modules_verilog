module bus_switch(
    input clk, resetn, valid, 
    input [7:0] addr_in,
    input [15:0] data_in,
    output reg [7:0] addr_out_a,
    output reg [15:0] data_out_a,
    output reg [7:0] addr_out_b,
    output reg [15:0] data_out_b
);

reg [15:0] data;
reg [7:0] addr;

always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
        addr <= 8'b0;
        data <= 16'b0;
    end
    else if (valid) begin
        addr <= addr_in;
        data <= data_in;
    end
end

always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
        addr_out_a <= 8'b0;
        data_out_a <= 16'b0;
        addr_out_b <= 8'b0;
        data_out_b <= 16'b0;
    end
    else begin
        if (addr < 8'h3F) begin
            addr_out_a <= addr;
            data_out_a <= data;
            addr_out_b <= 8'b0;
            data_out_b <= 16'b0;
        end
        else if (addr >= 8'h40) begin
            addr_out_a <= 8'b0;
            data_out_a <= 16'b0;
            addr_out_b <= addr;
            data_out_b <= data;
        end
    end
end
endmodule