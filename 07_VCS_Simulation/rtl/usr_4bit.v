module usr_4bit (
    input wire clk,
    input wire rst_n,
    input wire [1:0] select,
    input wire shift_left_in,
    input wire shift_right_in,
    input wire [3:0] d,
    output reg [3:0] q );
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else begin
            case (select)
                2'b00: q <= q;
                2'b01: q <= {shift_right_in, q[3:1]};
                2'b10: q <= {q[2:0], shift_left_in};
                2'b11: q <= d;
                default: q <= q;
            endcase
        end
    end
endmodule
