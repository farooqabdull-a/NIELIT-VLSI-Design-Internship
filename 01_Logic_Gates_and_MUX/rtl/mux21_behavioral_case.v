module mux21_behavioral_case (
    input i0,
    input i1,
    input s,
    output reg y);
    always @(*) begin
        case (s)
            1'b0: y = i0;
            1'b1: y = i1;
            default: y = i0;
        endcase
    end
endmodule
