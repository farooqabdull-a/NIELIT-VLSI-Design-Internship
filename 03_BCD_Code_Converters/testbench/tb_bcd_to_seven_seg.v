module tb_bcd_to_seven_seg;
    reg [3:0] bcd;
    wire [6:0] seg;

    integer i;
    bcd_to_seven_seg uut (
        .bcd(bcd),
        .seg(seg));
    initial begin
        $display("Time\t BCD Input \t Segment Output (abcdefg)");
        $monitor("%0t\t %b (%d) \t %b", $time, bcd, bcd, seg);

        for (i = 0; i < 16; i = i + 1) begin
            bcd = i;
            #10;
        end

        $finish;
    end
endmodule
