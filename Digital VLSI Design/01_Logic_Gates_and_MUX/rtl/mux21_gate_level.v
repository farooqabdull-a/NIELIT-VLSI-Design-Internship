module mux21_gate_level (
    input i0,
    input i1,
    input s,
    output y
);
    wire s_bar;
    wire w0;
    wire w1;
    not u_not (s_bar, s);
    and u_and0 (w0, i0, s_bar);
    and u_and1 (w1, i1, s);
    or  u_or0 (y, w0, w1);
endmodule
