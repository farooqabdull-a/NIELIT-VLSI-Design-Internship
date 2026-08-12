# Automatic Railway Level Crossing Controller

A six-state Moore FSM that automatically controls a railway level
crossing gate, warning light, and road traffic signal, with a
dedicated fail-safe ERROR state for invalid/unexpected sensor
sequences. Designed as a mini project for the NIELIT Calicut & NIT
Calicut "Online Internship on Analog and Digital VLSI Design Flow."

## Highlights

- **RTL**: Synthesisable Verilog-2001/SV, two-always-block FSM coding style
- **Verification**: Self-checking testbench, 7 directed scenarios, 29 assertions — **all passing, 100% FSM state coverage**
- **Synthesis**: Generic synthesis with Yosys (91 cells / 13 flip-flops) and standard-cell synthesis with Synopsys Design Compiler (SAED32, timing closes with 0.19 ns slack)
- **Fail-safe design**: gate is forced CLOSED and road forced RED on any illegal sensor sequence; only an explicit reset clears the fault

## Repository structure

```
.
├── rtl/
│   └── railway_crossing_controller.v      # DUT: synthesisable FSM
├── testbench/
│   └── tb_railway_crossing_controller.v   # self-checking testbench (T1–T7)
├── sim/
│   ├── logs/
│   │   └── simulation_log.txt             # full Icarus Verilog simulation transcript
│   ├── waveforms/
│   │   ├── waveform_full_run_T1-T7.png    # full-run overview, all 7 scenarios
│   │   └── waveform_zoom_T2_normal_crossing.png  # zoomed single crossing cycle
│   └── schematics/
│       ├── rtl_schematic_yosys.png        # RTL-level schematic (Yosys)
│       ├── vivado_rtl_schematic.png       # RTL-level schematic (Vivado)
│       └── gate_level_schematic_appendixA.png    # full gate-level netlist (91 cells)
└── docs/
    ├── fsm_state_diagram.png              # 6-state Moore FSM diagram
    └── synthesis_report.md                # area / power / timing / synthesis details
```

## FSM overview

| State | Gate | Road signal | Warning | Exit condition |
|---|---|---|---|---|
| S_IDLE | Open | Green | Off | `sensor_a` → S_WARNING; invalid sensor combo → S_ERROR |
| S_WARNING | Open | Red | On | one cycle, then → S_CLOSING |
| S_CLOSING | In transit | Red | Blinking | timer reaches `CLOSE_TIME` → S_CROSS |
| S_CROSS | Closed | Red | Blinking | `sensor_b` → S_OPENING |
| S_OPENING | In transit | Red | Blinking | timer reaches `OPEN_TIME` → S_IDLE |
| S_ERROR | Forced closed | Red | Steady ON | only `rst_n` (fail-safe latch) |

See `docs/fsm_state_diagram.png` for the full state diagram.

## Ports

| Port | Dir | Description |
|---|---|---|
| `clk` | in | system clock |
| `rst_n` | in | active-low async reset |
| `sensor_a` | in | train approaching (single-cycle pulse, before crossing) |
| `sensor_b` | in | train departed (single-cycle pulse, after crossing) |
| `gate_closed` | out | 1 = gate fully closed |
| `warning_light` | out | blinks during closing/crossing/opening, steady in ERROR |
| `road_red` | out | 1 = road signal RED |
| `error_flag` | out | 1 = latched into fail-safe ERROR state |
| `state_debug` | out [2:0] | current state, for waveform/debug visibility |

Parameters: `CLOSE_TIME`, `OPEN_TIME` (gate travel time in clock
cycles), `BLINK_DIV` (warning-light blink divider).

## Running the simulation

Requires [Icarus Verilog](http://iverilog.icarus.com/):

```bash
iverilog -o sim/sim.out rtl/railway_crossing_controller.v testbench/tb_railway_crossing_controller.v
cd sim && vvp sim.out
```

This reproduces `sim/logs/simulation_log.txt` — all 29 checks passing
and 100% (6/6) FSM state coverage. It also writes a `railway_crossing.vcd`
waveform dump you can view in GTKWave.

## Test scenarios

| ID | Scenario | Purpose |
|---|---|---|
| T1 | Reset behaviour | Confirms IDLE / gate-open / road-green / error-clear after `rst_n` |
| T2 | Normal single-train crossing | Full WARNING→CLOSING→CROSSING→OPENING→IDLE sequence |
| T3 | Back-to-back trains | Two full crossings in succession with no idle-gap issue |
| T4 | Train lingers on crossing | Gate must stay safely closed for an extended dwell time |
| T5 | Invalid: `sensor_b` with no `sensor_a` | Fail-safe ERROR entry + reset recovery |
| T6 | Invalid: `sensor_a` and `sensor_b` together | Fail-safe ERROR entry on simultaneous sensors |
| T7 | Reset recovery from ERROR | Confirms a clean IDLE state and cleared `error_flag` after reset |

## Synthesis & timing

See [`docs/synthesis_report.md`](docs/synthesis_report.md) for the
full area, power, QoR, and critical-path timing reports (Yosys generic
flow + Synopsys Design Compiler on SAED32 RVT), and
`sim/schematics/` for the RTL and gate-level schematic images.

## Toolchain

Icarus Verilog 12.0 · Yosys 0.33 · Synopsys Design Compiler · Xilinx
Vivado 2018 · Graphviz

---
Submitted as a mini project report for the NIELIT Calicut Online
Internship on Analog and Digital VLSI Design Flow, by Farooq Abdulla
(Batch 01).
