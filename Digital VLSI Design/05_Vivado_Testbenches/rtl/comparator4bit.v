`timescale 1ns/1ps
module comparator4bit(
    input wire [3:0] A,
    input wire [3:0] B,
    output reg AGTB,
    output reg ALTB,
    output reg AEQB);
    always @(*) begin
        if (A > B) begin
            AGTB = 1'b1; ALTB = 1'b0; AEQB = 1'b0;
        end else if (A < B) begin
            AGTB = 1'b0; ALTB = 1'b1; AEQB = 1'b0;
        end else begin
            AGTB = 1'b0; ALTB = 1'b0; AEQB = 1'b1;
        end
    end
endmodule
