module bcd_to_excess3 (
    input [3:0] bcd,
    output reg [3:0] excess3);
    always @(*) begin
        if (bcd <= 4'd9) begin
            excess3 = bcd + 4'b0011;
        end else begin
            excess3 = 4'bxxxx;
        end
    end
endmodule
