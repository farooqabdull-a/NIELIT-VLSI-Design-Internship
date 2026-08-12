# Assignment 05 — Testbench Design and Simulation using Vivado

## Overview
- **Q1:** 2:1 MUX testbench — applies all 4 input combinations with 10 ns delays.
- **Q2:** Self-checking 4-bit magnitude comparator testbench — exhaustive 256-combination sweep with automatic pass/fail checking.
- **Q3:** D flip-flop with synchronous reset — clock generation, reset assertion, varied D input verification.
- **Q4:** Testbench for the 4-bit up/down counter from Assignment 04, run in Vivado.

## Files
| Path | Description |
|---|---|
| `rtl/mux2to1.v` | 2:1 MUX design |
| `rtl/comparator4bit.v` | 4-bit magnitude comparator |
| `rtl/dff_sync_rst.v` | D flip-flop, synchronous reset |
| `rtl/updown_counter.v` | 4-bit up/down counter |
| `testbench/tb_mux2to1.v` | MUX testbench |
| `testbench/tb_comparator4bit.v` | Self-checking comparator testbench (exhaustive) |
| `testbench/tb_dff_sync_rst.v` | D-FF testbench |
| `testbench/tb_updown_counter.v` | Up/down counter testbench |

## Results
| Image | Description |
|---|---|
| `results/a05_q1_mux2to1_schematic.png` | RTL schematic — MUX |
| `results/a05_q1_mux2to1_simulation.png` | Vivado simulation — MUX |
| `results/a05_q2_comparator_schematic.png` | RTL schematic — comparator |
| `results/a05_q2_comparator_simulation.png` | Vivado simulation — comparator (exhaustive) |
| `results/a05_q2_comparator_tclconsole.png` | Tcl console log — comparator self-check |
| `results/a05_q3_dff_schematic.png` | RTL schematic — D flip-flop |
| `results/a05_q3_dff_simulation.png` | Vivado simulation — D flip-flop |
| `results/a05_q3_dff_tclconsole.png` | Tcl console log — D flip-flop |
| `results/a05_q4_updowncounter_schematic.png` | RTL schematic — up/down counter |
| `results/a05_q4_updowncounter_simulation.png` | Vivado simulation — up/down counter |

**Tools used:** Xilinx Vivado
