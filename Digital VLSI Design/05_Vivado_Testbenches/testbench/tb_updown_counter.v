`timescale 1ns/1ps
module tb_updown_counter;
    reg clk, rst, up_down;
    wire [3:0] count;

    updown_counter DUT (.clk(clk),.rst(rst),.up_down(up_down),.count(count));

    initial clk = 1'b0;
    always #5 clk = ~clk;
    initial begin
        $dumpfile("updown_counter.vcd");
        $dumpvars(0, tb_updown_counter);
    end
    initial begin
        $monitor("t=%0t | rst=%b up_down=%b -> count=%b (%0d)",$time, rst, up_down, count, count);
        rst = 1'b1; up_down = 1'b1;
        #12;
        rst = 1'b0;
        repeat (15) @(posedge clk);
        @(negedge clk);
        $display(">>> UP counting phase complete. count = %0d (expect 15)", count);

        up_down = 1'b0;
        repeat (15) @(posedge clk);
        @(negedge clk);
        $display(">>> DOWN counting phase complete. count = %0d (expect 0)", count);

        rst = 1'b1;
        #7;
        $display(">>> Async reset check: count = %0d (expect 0)", count);
        rst = 1'b0;
        #10;
        $display("Simulation complete.");

        $finish;
    end
endmodule
