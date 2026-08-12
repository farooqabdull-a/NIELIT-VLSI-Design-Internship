`timescale 1ns/1ps
module tb_dff_sync_rst;
    reg clk, rst, d;
    wire q;

    dff_sync_rst DUT (.clk(clk),.rst(rst),.d(d),.q(q));

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile ("dff_sync_rst.vcd");
        $dumpvars(0, tb_dff_sync_rst);
    end

    initial begin
        $monitor("t=%0t | clk=%b rst=%b d=%b -> q=%b", $time, clk, rst, d, q);
        rst = 1'b1;
        d = 1'b0;
        @(posedge clk);
        @(posedge clk);

        rst = 1'b0;
        d = 1'b1; @(posedge clk);
        d = 1'b0; @(posedge clk);
        d = 1'b1; @(posedge clk);
        d = 1'b1; @(posedge clk);
        d = 1'b0; @(posedge clk);

        rst = 1'b1; d = 1'b1; @(posedge clk);
        rst = 1'b0;
        d = 1'b1; @(posedge clk);
        d = 1'b0; @(posedge clk);
        #10;
        $display("Simulation complete.");
        $finish;
    end
endmodule
