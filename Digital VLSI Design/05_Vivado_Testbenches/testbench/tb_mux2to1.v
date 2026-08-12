`timescale 1ns/1ps
module tb_mux2to1;

    reg  A, B, sel;
    wire Y;

    mux2to1 DUT (.A(A),.B(B),.sel(sel),.Y(Y));

    initial begin

        $dumpfile("mux2to1.vcd");
        $dumpvars(0, tb_mux2to1);

        $display("time\tsel\tA\tB\tY");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, sel, A, B, Y);

        sel = 0; A = 0; B = 0;
        #10;

        sel = 0; A = 1; B = 0;
        #10;

        sel = 1; A = 0; B = 1;
        #10;

        sel = 1; A = 1; B = 0;
        #10;

        $display("Simulation complete.");
        $finish;
    end

endmodule
