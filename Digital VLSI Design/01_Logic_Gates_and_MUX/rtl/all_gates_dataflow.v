module all_gates_dataflow(
    input a,
    input b,
    output out_not,
    output out_or,
    output out_nand,
    output out_nor,
    output out_xor,
    output out_xnor);

    assign out_not  = ~a;
    assign out_or   = a | b;
    assign out_nand = ~(a & b);
    assign out_nor  = ~(a | b);
    assign out_xor  = a ^ b;
    assign out_xnor = ~(a ^ b);

endmodule
