`timescale 1ns/1ps
module alu_8bit (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] opcode,
    output reg [7:0] alu_out,
    output reg carry_out );
    always @(*) begin
        alu_out  = 8'b0000_0000;
        carry_out = 1'b0;

        case (opcode)
            3'b000: begin
                {carry_out, alu_out} = a + b;
            end
            3'b001: begin
                alu_out = a - b;
                carry_out = (a < b);
            end
            3'b010: begin
                alu_out = a & b;
            end
            3'b011: begin
                alu_out = a | b;
            end
            3'b100: begin
                alu_out = a ^ b;
            end
            3'b101: begin
                alu_out = a << 1;
            end
            3'b110: begin
                alu_out = a >> 1;
            end
            3'b111: begin
                alu_out = a;
            end
            default: begin
                alu_out = a;
            end
        endcase
    end
endmodule
