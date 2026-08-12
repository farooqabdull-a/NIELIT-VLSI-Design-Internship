module mux21_behavioral_always (
    input i0,
    input i1,
    input s,
    output reg y);
    always @(*) begin
        y = (i0 & ~s) | (i1 & s);
    end
endmodule
