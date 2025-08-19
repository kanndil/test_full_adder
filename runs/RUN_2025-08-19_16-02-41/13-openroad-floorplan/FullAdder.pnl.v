module FullAdder (a_i,
    b_i,
    cin_i,
    cout_o,
    sum_o);
 input a_i;
 input b_i;
 input cin_i;
 output cout_o;
 output sum_o;

 wire _0_;
 wire _1_;
 wire _2_;
 wire VPWR;
 wire VGND;

 sky130_fd_sc_hd__o21ai_2 _3_ (.A1(_0_),
    .A2(_2_),
    .B1(_1_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(cout_o));
 sky130_fd_sc_hd__inv_2 _4_ (.A(cin_i),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_0_));
 sky130_fd_sc_hd__nand2_2 _5_ (.A(b_i),
    .B(a_i),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_1_));
 sky130_fd_sc_hd__xnor2_2 _6_ (.A(b_i),
    .B(a_i),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(_2_));
 sky130_fd_sc_hd__xnor2_2 _7_ (.A(cin_i),
    .B(_2_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(sum_o));
endmodule
