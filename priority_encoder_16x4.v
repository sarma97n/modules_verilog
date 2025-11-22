module priority_encoder_16x4(D,Y);
input [15:0]D;
output reg [3:0]Y;

integer i;
reg found;

always @(*) begin
    Y = 4'b0000;
    found = 0;
    for (i = 15; i >= 0; i = i - 1) begin
        if (D[i] && !found) begin
            Y = i;
            found = 1'b1;
        end
    end
end
endmodule