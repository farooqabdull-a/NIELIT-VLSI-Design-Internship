module seq_detector (
    input wire clk,
    input wire rst_n,
    input wire din,
    output reg dout
);
    // State Declarations using One-Hot-like Encoding parameters
    localparam [2:0] S_IDLE = 3'b000,
                      S_1    = 3'b001,
                      S_10   = 3'b010,
                      S_101  = 3'b011,
                      S_1011 = 3'b100;

    reg [2:0] current_state, next_state;

    // 1. Sequential State Register Block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S_IDLE;
        else
            current_state <= next_state;
    end

    // 2. Next-State Combinational Logic Block
    always @(*) begin
        case (current_state)
            S_IDLE: next_state = (din) ? S_1 : S_IDLE;
            S_1   : next_state = (din) ? S_1 : S_10;
            S_10  : next_state = (din) ? S_101 : S_IDLE;
            S_101 : next_state = (din) ? S_1011 : S_10;
            S_1011: next_state = (din) ? S_1 : S_10;
            default: next_state = S_IDLE;
        endcase
    end

    // 3. Mealy Output Combinational Logic Block
    always @(*) begin
        if ((current_state == S_1011) && (din == 1'b0))
            dout = 1'b1;
        else
            dout = 1'b0;
    end
endmodule
