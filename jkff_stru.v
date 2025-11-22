/*module sr_latch(
    input S,R,
    output Q,Qbar
);

nand G1(Q, R, Qbar);
nand G2(Qbar, S, Q);
endmodule

module jkff_stru(
    input J,K,clk,reset,
    output Q,Qbar
);

wire [7:0]w;

nand G1(w[0], J, Qbar,  clk);
nand G2(w[1], K, Q, clk);

assign w[2] = (reset) ? 1'b0 : w[0];
assign w[3] = (reset) ? 1'b1 : w[1];

sr_latch SR1(.S(w[2]), .R(w[3]), .Q(w[4]), .Qbar(w[5]));

assign w[6] = (reset) ? 1'b0 : w[4];
assign w[7] = (reset) ? 1'b1 : w[5];

sr_latch SR2(.S(w[6]), .R(w[7]), .Q(Q), .Qbar(Qbar));

endmodule
*/

module sr_latch(
    input S, R,
    output Q, Qbar
);
    nand G1(Q, R, Qbar);
    nand G2(Qbar, S, Q);
endmodule

module jkff_stru(
    input J, K, clk, reset,
    output Q, Qbar
);
    wire w_master, w_master_bar;

    
    wire S_master, R_master;
    assign S_master = reset ? 1'b1 : ~(J & Qbar & clk); 
    assign R_master = reset ? 1'b0 : ~(K & Q & clk);


    sr_latch master(.S(S_master), .R(R_master), .Q(w_master), .Qbar(w_master_bar));

    
    wire S_slave, R_slave;
    assign S_slave = reset ? 1'b0 : w_master;     
    assign R_slave = reset ? 1'b1 : w_master_bar;   

    
    sr_latch slave(.S(S_slave), .R(R_slave), .Q(Q), .Qbar(Qbar));
endmodule