`timescale 1ns/1ps
module dff_sync_rst(
    input wire clk,
    input wire rst,
    input wire d,
    output reg q);
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
