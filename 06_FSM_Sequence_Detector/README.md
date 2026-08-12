# Assignment 06 — Finite State Machines (FSMs): '1001' Sequence Detector

## Overview
Sequence detector for the bit pattern **'1001'**, implemented as both a **Mealy** FSM (4 states) and a **Moore** FSM (5 states), with a feature-by-feature comparison of the two design styles (state count, output dependency, timing, glitch susceptibility, and design complexity).

> Note: The source assignment provides only the state diagrams and RTL for this topic — no separate testbench/simulation captures were included.

## Files
| Path | Description |
|---|---|
| `rtl/mealy_1001_detector.v` | Mealy FSM implementation |
| `rtl/moore_1001_detector.v` | Moore FSM implementation |

## Results
| Image | Description |
|---|---|
| `results/a06_q1_mealy_fsm_diagram.png` | Mealy FSM state diagram |
| `results/a06_q1_moore_fsm_diagram.png` | Moore FSM state diagram |

## Mealy vs. Moore Comparison
| Feature | Mealy FSM | Moore FSM |
|---|---|---|
| State Count | Fewer (4 states) | More (5 states) |
| Output Dependency | Current state + input | Current state only |
| Output Timing | Immediate, can spike within a cycle | Synchronized with clock edge |
| Glitch Susceptibility | High | Low |
| Design Complexity | Slightly more complex output logic | Easier to write/debug/trace |
