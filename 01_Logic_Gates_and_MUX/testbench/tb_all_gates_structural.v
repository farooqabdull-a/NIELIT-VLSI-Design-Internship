module tb_all_gates_structual;

    reg a;
    reg b;
    wire str_not_a, str_or, str_nand, str_nor, str_xor, str_xnor;

    all_gates_structural uut_str (
        .a(a), .b(b),
        .out_not_a(str_not_a), .out_or(str_or), .out_nand(str_nand),
        .out_nor(str_nor), .out_xor(str_xor), .out_xnor(str_xnor)
    );

    initial begin

        $display("Time\t A B | NOT OR  NAND NOR XOR XNOR");
        $monitor("%0t\t %b %b | %b  %b  %b   %b   %b   %b",
                  $time, a, b,str_not_a, str_or, str_nand, str_nor, str_xor, str_xnor);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
