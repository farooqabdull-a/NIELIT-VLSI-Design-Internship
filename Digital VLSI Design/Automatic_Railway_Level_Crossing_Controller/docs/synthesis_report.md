# Synthesis, Area, Power & Timing Reports

## Generic synthesis (Yosys 0.33)

Yosys generic `synth` flow (proc → opt → fsm extraction → techmap → abc
mapping to generic gate primitives). No vendor/foundry liberty file was
targeted, so this is a technology-independent complexity measure.

```
Number of wires:              76
Number of wire bits:         110
Number of public wires:       13
Number of public wire bits:   33
Number of cells:               91
  $_ANDNOT_   26
  $_AND_       4
  $_DFF_PN0_  13
  $_MUX_       1
  $_NAND_      9
  $_NOR_       8
  $_NOT_       2
  $_ORNOT_     5
  $_OR_       15
  $_XNOR_      3
  $_XOR_       5
```

13 flip-flops are inferred: 3 bits for the FSM state register, plus two
8-bit counters (`timer_cnt` for gate close/open timing, `blink_cnt` for
the warning-light divider) — 19 raw D-type bits before optimisation
collapses unused/constant bits down to the 13 actually needed.

## Standard-cell synthesis (Synopsys Design Compiler, SAED32 RVT, ss0p95v125c)

**Area**

| Metric | Value |
|---|---|
| Combinational area | 105.98 |
| Non-combinational area | 92.51 |
| Buf/Inv area | 7.62 |
| Cell area | 198.49 |
| Design area | 216.82 |

**Power**

| Metric | Value |
|---|---|
| Cell internal power | 87.16 µW (96%) |
| Net switching power | 3.33 µW (4%) |
| Total dynamic power | 90.49 µW |
| Cell leakage power | 9.77 nW |

**Timing (QoR)**

| Metric | Value |
|---|---|
| Levels of logic | 9.00 |
| Critical path length | 0.75 ns |
| Critical path slack | 0.19 ns (MET) |
| Clock period | 1.00 ns |
| Total negative slack | 0.00 |
| Violating paths | 0 |

Critical path: `timer_cnt_reg[1]` → `timer_cnt_reg[7]` (the 8-bit gate
timer chain), 9 logic levels, slack met with 0.19 ns margin at a 1 GHz
target clock.

## Toolchain used

| Tool | Version | Purpose |
|---|---|---|
| Icarus Verilog | 12.0 (stable) | RTL simulation (compile + vvp execution) |
| Yosys | 0.33 | Generic logic synthesis, statistics report, schematic generation |
| GTKWave-equivalent (VCD + Python/matplotlib) | - | Waveform rendering from the VCD dump |
| Graphviz (dot) | - | FSM diagram and Yosys schematic rendering |
| Synopsys Design Compiler | W-2024.09 | Standard-cell synthesis, area/power/timing |
| Xilinx Vivado | 2018 | RTL schematic |

See `sim/schematics/` for the RTL and gate-level schematic images, and
`sim/logs/simulation_log.txt` for the full simulation transcript.
