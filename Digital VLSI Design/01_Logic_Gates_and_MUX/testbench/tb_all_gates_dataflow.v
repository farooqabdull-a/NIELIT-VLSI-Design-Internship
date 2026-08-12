module tb_all_gates;

reg a;
reg b;

wire df_not_a, df_or, df_nand, df_nor, df_xor, df_xnor;
    all_gates_dataflow uut_df (
        .a(a), .b(b),
        .out_not_a(df_not_a), .out_or(df_or), .out_nand(df_nand),
        .out_nor(df_nor), .out_xor(df_xor), .out_xnor(df_xnor));

initial begin

    $display("Time\t A B | NOT OR  NAND NOR XOR XNOR");
    $monitor("%0t\t %b %b | %b  %b  %b   %b   %b   %b",
              $time, a, b, df_not_a, df_or, df_nand, df_nor, df_xor, df_xnor);

    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end

endmodule
