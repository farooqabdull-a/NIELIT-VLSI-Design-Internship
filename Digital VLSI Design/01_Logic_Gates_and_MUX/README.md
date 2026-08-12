# Assignment 01 — Combinational Logic Design: Logic Gates & 2:1 MUX

## Overview
- **Q1:** All six fundamental logic gates (OR, NOT, NAND, NOR, XOR, XNOR) implemented in both **dataflow** and **structural (gate-level)** modeling styles.
- **Q2:** 2:1 Multiplexer implemented in six different Verilog styles — continuous assignment, conditional operator, behavioral `always`, `if-else`, `case`, and gate-level primitives.

## Files
| Path | Description |
|---|---|
| `rtl/all_gates_dataflow.v` | Dataflow model of all 6 gates |
| `rtl/all_gates_structural.v` | Structural (primitive-instantiated) model of all 6 gates |
| `rtl/mux21_dataflow_assign.v` | 2:1 MUX — continuous assignment |
| `rtl/mux21_dataflow_conditional.v` | 2:1 MUX — ternary operator |
| `rtl/mux21_behavioral_always.v` | 2:1 MUX — behavioral `always` block |
| `rtl/mux21_behavioral_ifelse.v` | 2:1 MUX — `if-else` |
| `rtl/mux21_behavioral_case.v` | 2:1 MUX — `case` statement |
| `rtl/mux21_gate_level.v` | 2:1 MUX — gate-level primitives |
| `testbench/tb_all_gates_dataflow.v` | Testbench for dataflow gates |
| `testbench/tb_all_gates_structural.v` | Testbench for structural gates |

## Results
| Image | Description |
|---|---|
| `results/a01_gate_symbols.png` | Standard logic gate symbols |
| `results/a01_q1_dataflow_schematic.png` | RTL schematic — dataflow gates |
| `results/a01_q1_dataflow_simulation.png` | Simulation waveform — dataflow gates |
| `results/a01_q1_structural_schematic.png` | RTL schematic — structural gates |
| `results/a01_q1_structural_simulation.png` | Simulation waveform — structural gates |

**Tools used:** Vivado 
