`timescale 1ns/1ps
// =====================================================================
// Testbench : tb_railway_crossing_controller
// Covers    :
//   T1 - Reset behaviour
//   T2 - Normal single-train crossing sequence
//   T3 - Back-to-back trains (two trains, no idle gap)
//   T4 - Train lingering on crossing (sensor_b delayed)
//   T5 - Invalid input: sensor_b asserted with no prior sensor_a
//   T6 - Invalid input: sensor_a and sensor_b asserted together
//   T7 - Reset recovery out of the ERROR (fail-safe) state
//
// Also implements a lightweight, hand-rolled FSM STATE coverage model
// (a stand-in for the "code coverage report" deliverable, since a
// commercial coverage tool such as Questa/VCS/Vivado is normally used
// for the official submission - see project report, Section 6).
// =====================================================================
module tb_railway_crossing_controller;

    localparam CLOSE_TIME = 4;
    localparam OPEN_TIME  = 4;
    localparam BLINK_DIV  = 2;

    reg  clk, rst_n;
    reg  sensor_a, sensor_b;
    wire gate_closed, warning_light, road_red, error_flag;
    wire [2:0] state_debug;

    integer errors;
    integer test_num;
    integer hit_count;

    // ---- state coverage bins -----------------------------------------
    reg covered_idle, covered_warning, covered_closing,
        covered_cross, covered_opening, covered_error;

    railway_crossing_controller #(
        .CLOSE_TIME(CLOSE_TIME),
        .OPEN_TIME (OPEN_TIME),
        .BLINK_DIV (BLINK_DIV)
    ) dut (
        .clk           (clk),
        .rst_n         (rst_n),
        .sensor_a      (sensor_a),
        .sensor_b      (sensor_b),
        .gate_closed   (gate_closed),
        .warning_light (warning_light),
        .road_red      (road_red),
        .error_flag    (error_flag),
        .state_debug   (state_debug)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    // state coverage sampler
    always @(posedge clk) begin
        case (state_debug)
            3'd0: covered_idle    = 1'b1;
            3'd1: covered_warning = 1'b1;
            3'd2: covered_closing = 1'b1;
            3'd3: covered_cross   = 1'b1;
            3'd4: covered_opening = 1'b1;
            3'd5: covered_error   = 1'b1;
        endcase
    end

    task automatic pulse_a; begin
        @(negedge clk); sensor_a = 1'b1;
        @(negedge clk); sensor_a = 1'b0;
    end endtask

    task automatic pulse_b; begin
        @(negedge clk); sensor_b = 1'b1;
        @(negedge clk); sensor_b = 1'b0;
    end endtask

    reg [8*64:1] cur_msg; // widened to 64 chars so log messages print in full
    task check(input cond); begin
        if (!cond) begin
            errors = errors + 1;
            $display("  [FAIL] T%0d: %s (time=%0t)", test_num, cur_msg, $time);
        end else begin
            $display("  [PASS] T%0d: %s", test_num, cur_msg);
        end
    end endtask

    task automatic wait_state(input [2:0] s, input integer max_cycles);
        integer i;
        begin
            i = 0;
            while (state_debug !== s && i < max_cycles) begin
                @(posedge clk);
                i = i + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("railway_crossing.vcd");
        $dumpvars(0, tb_railway_crossing_controller);

        clk = 0; rst_n = 0; sensor_a = 0; sensor_b = 0;
        errors = 0; test_num = 0;
        covered_idle = 0; covered_warning = 0; covered_closing = 0;
        covered_cross = 0; covered_opening = 0; covered_error = 0;

        // ---------------- T1: Reset behaviour --------------------------
        test_num = 1;
        repeat (3) @(negedge clk);
        rst_n = 1;
        @(posedge clk);
        cur_msg = "state is IDLE after reset";        check(state_debug == 3'd0);
        cur_msg = "gate is OPEN after reset";          check(gate_closed == 1'b0);
        cur_msg = "road is GREEN after reset";         check(road_red == 1'b0);
        cur_msg = "error_flag clear after reset";      check(error_flag == 1'b0);

        // ---------------- T2: Normal single train crossing -------------
        test_num = 2;
        pulse_a(); // train approaches
        @(posedge clk);
        cur_msg = "enters WARNING after sensor_a";     check(state_debug == 3'd1);
        wait_state(3'd2, 5);
        cur_msg = "enters CLOSING state";              check(state_debug == 3'd2);
        cur_msg = "road turns RED while gate is closing"; check(road_red == 1'b1);
        wait_state(3'd3, CLOSE_TIME + 3);
        cur_msg = "gate reaches CROSSING (fully closed)"; check(state_debug == 3'd3);
        cur_msg = "gate_closed asserted during crossing"; check(gate_closed == 1'b1);
        pulse_b(); // train departs
        wait_state(3'd4, 3);
        cur_msg = "enters OPENING after sensor_b";     check(state_debug == 3'd4);
        wait_state(3'd0, OPEN_TIME + 3);
        cur_msg = "returns to IDLE after gate fully opens"; check(state_debug == 3'd0);
        cur_msg = "gate OPEN once back in IDLE";       check(gate_closed == 1'b0);
        cur_msg = "road GREEN once back in IDLE";      check(road_red == 1'b0);

        // ---------------- T3: Back-to-back trains -----------------------
        test_num = 3;
        pulse_a(); wait_state(3'd3, CLOSE_TIME + 5);
        cur_msg = "train #1 reaches CROSSING";         check(state_debug == 3'd3);
        pulse_b(); wait_state(3'd0, OPEN_TIME + 5);
        cur_msg = "train #1 fully cleared, back to IDLE"; check(state_debug == 3'd0);
        pulse_a(); wait_state(3'd3, CLOSE_TIME + 5);
        cur_msg = "train #2 reaches CROSSING correctly"; check(state_debug == 3'd3);
        pulse_b(); wait_state(3'd0, OPEN_TIME + 5);
        cur_msg = "train #2 fully cleared, back to IDLE"; check(state_debug == 3'd0);

        // ---------------- T4: Train lingers on crossing -----------------
        test_num = 4;
        pulse_a(); wait_state(3'd3, CLOSE_TIME + 5);
        cur_msg = "reaches CROSSING before lingering check"; check(state_debug == 3'd3);
        repeat (10) @(posedge clk); // train takes longer
        cur_msg = "stays safely in CROSSING while train present"; check(state_debug == 3'd3);
        cur_msg = "gate remains CLOSED throughout linger"; check(gate_closed == 1'b1);
        pulse_b(); wait_state(3'd0, OPEN_TIME + 5);
        cur_msg = "gate reopens once departure finally sensed"; check(state_debug == 3'd0);

        // ---------------- T5: Invalid - sensor_b with no sensor_a -------
        test_num = 5;
        pulse_b();
        @(posedge clk);
        cur_msg = "unexpected sensor_b in IDLE -> ERROR (fail-safe)"; check(state_debug == 3'd5);
        cur_msg = "gate forced CLOSED in ERROR state"; check(gate_closed == 1'b1);
        cur_msg = "error_flag asserted";               check(error_flag == 1'b1);
        rst_n = 0; @(negedge clk); rst_n = 1; @(posedge clk);
        cur_msg = "recovers to IDLE after reset";      check(state_debug == 3'd0);

        // ---------------- T6: Invalid - both sensors together -----------
        test_num = 6;
        @(negedge clk); sensor_a = 1; sensor_b = 1;
        @(negedge clk); sensor_a = 0; sensor_b = 0;
        @(posedge clk);
        cur_msg = "simultaneous sensors -> ERROR (fail-safe)"; check(state_debug == 3'd5);
        cur_msg = "road forced RED in ERROR state";    check(road_red == 1'b1);

        // ---------------- T7: Reset recovery from ERROR -----------------
        test_num = 7;
        rst_n = 0; @(negedge clk); rst_n = 1; @(posedge clk);
        cur_msg = "clean IDLE state restored after reset from ERROR"; check(state_debug == 3'd0);
        cur_msg = "error_flag cleared after reset";    check(error_flag == 1'b0);

        // ---------------- Coverage summary -------------------------------
        $display("\n===================== STATE COVERAGE REPORT =====================");
        $display(" S_IDLE    (0) : %s", covered_idle    ? "HIT" : "MISS");
        $display(" S_WARNING (1) : %s", covered_warning ? "HIT" : "MISS");
        $display(" S_CLOSING (2) : %s", covered_closing ? "HIT" : "MISS");
        $display(" S_CROSS   (3) : %s", covered_cross   ? "HIT" : "MISS");
        $display(" S_OPENING (4) : %s", covered_opening ? "HIT" : "MISS");
        $display(" S_ERROR   (5) : %s", covered_error   ? "HIT" : "MISS");
        hit_count = covered_idle + covered_warning + covered_closing
                  + covered_cross + covered_opening + covered_error;
        $display(" Coverage = %0d / 6 states = %0d %%",
                  hit_count, (hit_count * 100) / 6);
        $display("===================================================================\n");

        $display("===================== TEST SUMMARY ===============================");
        if (errors == 0)
            $display(" ALL TESTS PASSED (0 errors)");
        else
            $display(" %0d CHECK(S) FAILED", errors);
        $display("====================================================================");

        $finish;
    end

endmodule
