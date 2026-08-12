module mux21_dataflow_assign (
    input i0,
    input i1,
    input s,
    output y);
    assign y = (i0 & ~s) | (i1 & s);
endmodule
