// =====================================================================
// Module        : railway_crossing_controller
// Description   : Automatic Railway Level Crossing Controller (FSM based)
//
// sensor_a      : placed BEFORE the crossing on the track. Pulses high for
//                 one clock cycle the instant a train is detected approaching.
// sensor_b      : placed AFTER the crossing on the track. Pulses high for
//                 one clock cycle the instant the train has fully cleared
//                 the crossing (departure detected).
//
// gate_closed   : 1 = gate fully closed, 0 = gate fully open
// warning_light : blinks whenever the gate is not fully open & idle
// road_red      : 1 = road traffic signal RED, 0 = GREEN
// error_flag    : 1 = an invalid/unexpected sensor sequence occurred;
//                 system is latched into the fail-safe (gate CLOSED,
//                 warning ON, road RED) state until reset.
// =====================================================================
module railway_crossing_controller #(
    parameter CLOSE_TIME = 4,   // clock cycles modelled for gate to close
    parameter OPEN_TIME  = 4,   // clock cycles modelled for gate to open
    parameter BLINK_DIV  = 2    // clock cycles per warning-light toggle
)(
    input  wire clk,
    input  wire rst_n,          // active-low async reset
    input  wire sensor_a,       // train approaching (before crossing)
    input  wire sensor_b,       // train departed (after crossing)
    output reg  gate_closed,
    output reg  warning_light,
    output reg  road_red,
    output reg  error_flag,
    output reg  [2:0] state_debug // exposed for waveform/debug visibility
);

    // -----------------------------------------------------------------
    // State encoding
    // -----------------------------------------------------------------
    localparam [2:0] S_IDLE    = 3'd0, // gate open, road green
                      S_WARNING = 3'd1, // train sensed, warning starts
                      S_CLOSING = 3'd2, // gate lowering
                      S_CROSS   = 3'd3, // gate closed, train crossing
                      S_OPENING = 3'd4, // gate rising
                      S_ERROR   = 3'd5; // fail-safe latch

    reg [2:0] state, next_state;
    reg [7:0] timer_cnt;  // generic delay counter (closing/opening)
    reg [7:0] blink_cnt;  // clock divider for warning light

    // -----------------------------------------------------------------
    // Sequential: state register + timer + blink divider
    // -----------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            timer_cnt <= 8'd0;
            blink_cnt <= 8'd0;
        end else begin
            state <= next_state;

            // timer counts while gate is actively moving
            if (state == S_CLOSING || state == S_OPENING)
                timer_cnt <= timer_cnt + 1'b1;
            else
                timer_cnt <= 8'd0;

            // free running blink divider, reset when idle/error to save power
            if (state == S_IDLE)
                blink_cnt <= 8'd0;
            else
                blink_cnt <= blink_cnt + 1'b1;
        end
    end

    // -----------------------------------------------------------------
    // Combinational: next state logic (includes invalid-input handling)
    // -----------------------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                // Requirement (e): reject unexpected input combinations.
                // A departure pulse with no prior approach, or both
                // sensors together, is not a physically valid sequence.
                if (sensor_a && sensor_b)
                    next_state = S_ERROR;
                else if (sensor_b && !sensor_a)
                    next_state = S_ERROR;
                else if (sensor_a)
                    next_state = S_WARNING;
                else
                    next_state = S_IDLE;
            end

            S_WARNING: begin
                // one cycle of warning/road-red before the gate starts
                // physically moving (matches requirement b & c ordering)
                next_state = S_CLOSING;
            end

            S_CLOSING: begin
                if (timer_cnt >= CLOSE_TIME - 1)
                    next_state = S_CROSS;
                else
                    next_state = S_CLOSING;
            end

            S_CROSS: begin
                // Wait for confirmed full departure. Ignore a stray
                // sensor_a re-trigger here (another train already
                // accounted for) rather than corrupting the sequence.
                if (sensor_b)
                    next_state = S_OPENING;
                else
                    next_state = S_CROSS;
            end

            S_OPENING: begin
                if (timer_cnt >= OPEN_TIME - 1)
                    next_state = S_IDLE;
                else
                    next_state = S_OPENING;
            end

            S_ERROR: begin
                // Fail-safe: only a system reset clears the latch.
                next_state = S_ERROR;
            end

            default: next_state = S_ERROR;
        endcase
    end

    // -----------------------------------------------------------------
    // Moore outputs
    // -----------------------------------------------------------------
    always @(*) begin
        // safe defaults
        gate_closed   = 1'b1;
        warning_light = 1'b0;
        road_red      = 1'b1;
        error_flag    = 1'b0;
        state_debug   = state;

        case (state)
            S_IDLE: begin
                gate_closed   = 1'b0;
                road_red      = 1'b0;
                warning_light = 1'b0;
            end
            S_WARNING: begin
                gate_closed   = 1'b0; // still open, about to move
                road_red      = 1'b1;
                warning_light = 1'b1;
            end
            S_CLOSING: begin
                gate_closed   = 1'b0; // in transit, not yet closed
                road_red      = 1'b1;
                warning_light = blink_cnt[BLINK_DIV-1];
            end
            S_CROSS: begin
                gate_closed   = 1'b1;
                road_red      = 1'b1;
                warning_light = blink_cnt[BLINK_DIV-1];
            end
            S_OPENING: begin
                gate_closed   = 1'b1; // still physically closing->open transit
                road_red      = 1'b1;
                warning_light = blink_cnt[BLINK_DIV-1];
            end
            S_ERROR: begin
                gate_closed   = 1'b1; // fail-safe: force closed
                road_red      = 1'b1;
                warning_light = 1'b1; // steady (non-blinking) alarm
                error_flag    = 1'b1;
            end
        endcase
    end

endmodule
