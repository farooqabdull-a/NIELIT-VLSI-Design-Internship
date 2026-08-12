module mux21_behavioral_ifelse (
    input i0,
    input i1,
    input s,
    output reg y);
    always @(*) begin
        if (s == 1'b1) begin
            y = i1;
        end else begin
            y = i0;
        end
    end
endmodule
