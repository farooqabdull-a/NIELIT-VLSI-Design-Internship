module up_down_counter_async(
    input clk,
    input rst,
    input up_down,
    output reg [3:0] count);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else begin
            if (up_down)
                count <= count + 1'b1;
            else
                count <= count - 1'b1;
        end
    end
endmodule
