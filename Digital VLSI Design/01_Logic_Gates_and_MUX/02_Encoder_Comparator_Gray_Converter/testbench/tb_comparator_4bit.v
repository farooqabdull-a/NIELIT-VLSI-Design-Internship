module tb_comparator4bit;
    reg [3:0] A, B;
    wire AGTB, ALTB, AEQB;

    comparator4bit uut (.A(A), .B(B), .AGTB(AGTB), .ALTB(ALTB), .AEQB(AEQB));

    initial begin
        $display("Time\t A B | A_gt_B A_eq_B A_lt_B");
        $monitor("%0t\t %b %b | %b %b %b", $time, A, B, AGTB, AEQB, ALTB);

        A = 4'h5; B = 4'hF; #10;
        A = 4'hC; B = 4'h4; #10;
        A = 4'h2; B = 4'h9; #10;
        A = 4'hF; B = 4'hF; #10;
        A = 4'h0; B = 4'h0; #10;

        $finish;
    end
endmodule
