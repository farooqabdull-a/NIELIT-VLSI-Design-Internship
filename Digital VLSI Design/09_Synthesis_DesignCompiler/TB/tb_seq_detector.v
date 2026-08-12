`timescale 1ns/1ps
module tb_seq_detector;
    reg clk;
    reg rst_n;
    reg din;
    wire dout;

    seq_detector uut (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk; // 100MHz Clock

    initial begin
        $dumpfile("seq_sim.vcd");
        $dumpvars(0, tb_seq_detector);

        $monitor("Time=%4d ns | Reset=%b | Din=%b | Dout=%b | State=%b",
                 $time, rst_n, din, dout, uut.current_state);

        clk = 0; rst_n = 0; din = 0;
        #12 rst_n = 1;

        // Feed Sequence: 1 -> 0 -> 1 -> 1 -> 0 (Detection 1)
        @(posedge clk); din = 1;
        @(posedge clk); din = 0;
        @(posedge clk); din = 1;
        @(posedge clk); din = 1;
        @(posedge clk); din = 0; // dout should hit 1 here

        // Test Overlapping: Feed remaining bits to form another 10110
        // Current sequence tail is ..10. Add 1 -> 1 -> 0
        @(posedge clk); din = 1;
        @(posedge clk); din = 1;
        @(posedge clk); din = 0; // dout hits 1 again (overlapping verified)

        #20;
        $finish;
    end
endmodule
