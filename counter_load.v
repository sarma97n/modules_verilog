module counter_load #(
    parameter N = 4
    ) (
        input clk, reset, load,
        input [N-1:0] load_value, 
        output reg [N-1:0]count
    );

    always @(posedge clk or posedge reset) begin
        if (reset) count <= {N{1'b0}};
        else if (load) count <= load_value;
        else if (count == 4'b1111) count <= load_value;
        else count <= count + 1'b1;
    end

endmodule