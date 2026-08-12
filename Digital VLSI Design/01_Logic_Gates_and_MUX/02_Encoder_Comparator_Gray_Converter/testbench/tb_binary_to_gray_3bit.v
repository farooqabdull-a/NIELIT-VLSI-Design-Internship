module tb_binary_to_gray_3bit;
    reg [2:0] binary;
    wire [2:0] gray;

    integer i;
    binary_to_gray_3bit uut (.binary(binary),.gray(gray));
    initial begin
        $display("Time\t Binary \t Gray");
        $monitor("%0t\t %b \t %b", $time, binary, gray);
        for (i = 0; i < 8; i = i + 1) begin
            binary = i;
            #10;
        end
        $finish;
    end
endmodule
