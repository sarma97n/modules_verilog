module test_ten;
reg[3:0] a;
initial begin
a=1;
$monitor(" monitor Time: %0t, a: %b", $time,a);
$strobe("strobe Time: %0t, a: %b", $time,a);
// Display at time 0
$display("display Time: %0t, a: %b", $time,a);
a=2;
$display("display Time: %0t, a: %b", $time,a);
#20;
$display("display Time: %0t, a: %b", $time,a);
a=3;
a=4;
#10;
$strobe("strobe Time: %0t, a: %b", $time,a);
#10;
$finish;
// End the simulation
end
endmodule