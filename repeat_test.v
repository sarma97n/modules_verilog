module repeat_test;
reg [1:0]x;
reg [15:0]z;

initial begin
    x=2'b01;
    z={8{x}};
    $display("x=%d,  z=%h",x,z);
end
endmodule