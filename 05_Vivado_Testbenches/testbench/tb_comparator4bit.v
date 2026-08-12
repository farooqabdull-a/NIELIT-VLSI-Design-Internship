`timescale 1ns/1ps
module tb_comparator4bit;
    reg [3:0] A, B;
    wire AGTB, ALTB, AEQB;
    integer i, j;
    integer pass_count = 0;
    integer fail_count = 0;
    reg exp_AGTB, exp_ALTB, exp_AEQB;

    comparator4bit DUT (.A(A), .B(B),.AGTB(AGTB), .ALTB(ALTB), .AEQB(AEQB));

    initial begin
        $monitor("t=%0t | A=%b(%0d) B=%b(%0d) | AGTB=%b ALTB=%b AEQB=%b",
                  $time, A, A, B, B, AGTB, ALTB, AEQB);
    end

    initial begin
        $display("===== 4-bit Magnitude Comparator: Exhaustive Self-Check =====");
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i[3:0];
                B = j[3:0];
                #5;
                exp_AGTB = (A > B);
                exp_ALTB = (A < B);
                exp_AEQB = (A == B);
                if ((AGTB === exp_AGTB) && (ALTB === exp_ALTB) && (AEQB === exp_AEQB)) begin
                    pass_count = pass_count + 1;
                end else begin
                    fail_count = fail_count + 1;
                    $display(">>> FAIL: A=%0d B=%0d | Got AGTB=%b ALTB=%b AEQB=%b | Expected AGTB=%b ALTB=%b AEQB=%b",
                              A, B, AGTB, ALTB, AEQB, exp_AGTB, exp_ALTB,exp_AEQB);
                end
                #5;
            end
        end
        $display("TOTAL TESTS = %0d | PASS = %0d | FAIL = %0d", 256, pass_count, fail_count);
        if (fail_count == 0)
            $display(">>> RESULT: ALL TESTS PASSED <<<");
        else
            $display(">>> RESULT: SOME TESTS FAILED <<<");
        $finish;
    end
endmodule
