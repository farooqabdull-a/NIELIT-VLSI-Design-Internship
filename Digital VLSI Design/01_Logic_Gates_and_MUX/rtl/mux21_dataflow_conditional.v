module mux21_dataflow_conditional (
    input i0,
    input i1,
    input s,
    output y);
    assign y = s ? i1 : i0;
endmodule
