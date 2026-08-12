module moore_1001_detector (
    input clk,
    input rst_n,
    input x,
    output reg z);

    typedef enum reg [2:0] {
        S0 = 3'b000,
        S1 = 3'b001,
        S2 = 3'b010,
        S3 = 3'b011,
        S4 = 3'b100
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
                if (x) next_state = S4;
                else next_state = S0;
            end

            S4: begin
                if (x) next_state = S1;
                else next_state = S2; // Overlapping behavior: '10' matched
            end

            default: next_state = S0;
        endcase
    end

    always @(*) begin
        z = (current_state == S4) ? 1'b1 : 1'b0;
    end
endmodule
