module all_gates_structural(
    input a,
    input b,
    output out_not_a,
    output out_or,
    output out_nand,
    output out_nor,
    output out_xor,
    output out_xnor);

    not  u_not  (out_not_a, a);
    or   u_or   (out_or, a, b);
    nand u_nand (out_nand, a, b);
    nor  u_nor  (out_nor, a, b);
    xor  u_xor  (out_xor, a, b);
    xnor u_xnor (out_xnor, a, b);

endmodule
