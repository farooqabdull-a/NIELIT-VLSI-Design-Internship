`timescale 1ns/1ps
module tb_usr_4bit;
    reg clk;
    reg rst_n;
    reg [1:0] select;
    reg shift_left_in;
    reg shift_right_in;
    reg [3:0] d;
    wire [3:0] q;
    usr_4bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .shift_left_in(shift_left_in),
        .shift_right_in(shift_right_in),
        .d(d),
        .q(q));
    always #10 clk = ~clk;
    initial begin
        $dumpfile("usr_simulation.vcd");
        $dumpvars(0, tb_usr_4bit);
        clk = 0;
        rst_n = 0;
        select = 2'b00;
        shift_left_in = 0;
        shift_right_in = 0;
        d = 4'b0000;
        #15 rst_n = 1;

        #10;
        select = 2'b11;
        d = 4'b1010;

        #20;
        select = 2'b00;
        d = 4'b1111;
        #20;
        select = 2'b01;
        shift_right_in = 1;
        #20;
        shift_right_in = 0;
        #40;
        #20;
        select = 2'b10;
        shift_left_in = 1;
        #20;
        shift_left_in = 0;
        #40;
        $display("Simulation complete. Waveform file generated.");
        $finish;
    end
endmodule
