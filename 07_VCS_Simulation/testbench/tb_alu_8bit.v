`timescale 1ns/1ps
module tb_alu_8bit;
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    wire [7:0] alu_out;
    wire carry_out;
    alu_8bit uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .alu_out(alu_out),
        .carry_out(carry_out) );

    initial begin
        $display("\n---------------------------------------------------------");
        $display(" Time(ns) | Opcode | Input A | Input B | Out Result | Carry");
        $display("-----------------------------------------------------------");
        $monitor("%11d | %b | %b | %b | %b | %b",
                  $time, opcode, a, b, alu_out, carry_out);
    end
    initial begin

        $dumpfile("alu_simulation.vcd");
        $dumpvars(0, tb_alu_8bit);
        a = 8'h00; b = 8'h00; opcode = 3'b111;

        #10;
        opcode = 3'b000;
        a = 8'hF0; b = 8'h0F;
        #10;
        a = 8'hFF; b = 8'h01;
        #10;
        opcode = 3'b001;
        a = 8'h45; b = 8'h10;
        #10;
        a = 10; b = 20;
        #10;
        opcode = 3'b010;
        a = 8'b1100_1010; b = 8'b1010_0101;
        #10;
        opcode = 3'b011;
        a = 8'b1100_1010; b = 8'b1010_0101;
        #10;
        opcode = 3'b100;
        a = 8'b1100_1010; b = 8'b1010_0101;
        #10;
        opcode = 3'b101;
        a = 8'b1000_0011;
        #10;
        opcode = 3'b110;
        a = 8'b1000_0011;
        #10;
        $display("-----------------------------------------------------------");
        $finish;
    end
endmodule
