module tb_up_down_counter_async;
    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] count_async;

    up_down_counter_async uut_async (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count_async));

    always #5 clk = ~clk;
    initial begin

        clk = 0;
        rst = 0;
        up_down = 1;
        $display("Time\t RST\t UP_DN\t Count_Sync\t Count_Async");
        $monitor("%0t\t %b\t %b\t %d", $time, rst, up_down, count_async);

        #2 rst = 1;
        #5 rst = 0;

        up_down = 1;
        #160;
        up_down = 0;
        #160;

        #3 rst = 1;
        #10;
        rst = 0;

        #20;
        $finish;
    end
endmodule
