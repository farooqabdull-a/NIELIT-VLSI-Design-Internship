module mealy_1001_detector (
    input clk,
    input rst_n,
    input x,
    output reg z);

    typedef enum reg [1:0] {
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11
    } state_t;

    state_t current_state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin

        next_state = current_state;
        z = 1'b0;
        case (current_state)
            S0: begin
                if (x) next_state = S1;
                else next_state = S0;
            end

            S1: begin
                if (x) next_state = S1;
                else next_state = S2;
            end

            S2: begin
                if (x) next_state = S1;
                else next_state = S3;
            end

            S3: begin
                if (x) begin
                    next_state = S1;
                    z = 1'b1;
                end else begin
                    next_state = S0;
                end
            end

            default: next_state = S0;
        endcase
    end
endmodule
