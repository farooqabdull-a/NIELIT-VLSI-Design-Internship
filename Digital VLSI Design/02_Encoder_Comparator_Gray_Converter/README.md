# Assignment 02 — Combinational Logic Design: Encoder, Comparator, Gray Converter

## Overview
- **Q1:** 8:3 priority encoder — verified across all 8 one-hot input combinations.
- **Q2:** 4-bit magnitude comparator generating A>B, A=B, A<B outputs.
- **Q3:** 3-bit binary-to-Gray code converter.

## Files
| Path | Description |
|---|---|
| `rtl/encoder_8to3.v` | 8:3 encoder design |
| `rtl/comparator_4bit.v` | 4-bit magnitude comparator |
| `rtl/binary_to_gray_3bit.v` | 3-bit binary-to-Gray converter |
| `testbench/tb_encoder_8to3.v` | Encoder testbench |
| `testbench/tb_comparator_4bit.v` | Comparator testbench |
| `testbench/tb_binary_to_gray_3bit.v` | Gray converter testbench |

## Results
| Image | Description |
|---|---|
| `results/a02_q1_encoder_schematic.png` | RTL schematic — 8:3 encoder |
| `results/a02_q1_encoder_simulation.png` | Simulation waveform — 8:3 encoder |
| `results/a02_q2_comparator_schematic.png` | RTL schematic — comparator |
| `results/a02_q2_comparator_simulation.png` | Simulation waveform — comparator |
| `results/a02_q3_bin2gray_schematic.png` | RTL schematic — binary-to-Gray |
| `results/a02_q3_bin2gray_simulation.png` | Simulation waveform — binary-to-Gray |

**Tools used:** Vivado / ModelSim
