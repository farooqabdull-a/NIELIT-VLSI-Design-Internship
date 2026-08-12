# Assignment 09 — Logic Synthesis using Synopsys Design Compiler

## Overview
- **Q1:** 4-bit Universal Shift Register — synthesized and functionally verified.
- **Q2:** 8-bit ALU — synthesized; technology-mapped netlist examined for standard cells used.
- **Q3:** Sequence detector for **'10110'** — Mealy FSM, synthesized and validated against the SAED32 RVT standard-cell library.

Full area / power / timing (QoR) reports for the ALU and the sequence detector are included in `reports/`.

## Files
| Path | Description |
|---|---|
| `rtl/usr_4bit.v` | 4-bit universal shift register |
| `rtl/alu_8bit.v` | 8-bit ALU |
| `rtl/seq_detector.v` | '10110' sequence detector (Mealy FSM) |
| `testbench/tb_usr_4bit.v` | USR testbench |
| `testbench/tb_alu_8bit.v` | ALU testbench |
| `testbench/tb_seq_detector.v` | Sequence detector testbench |
| `reports/seq_detector_synth_reports.txt` | Area / power / QoR / timing report — seq_detector |
| `reports/alu_8bit_synth_reports.txt` | Area / power / QoR / timing report — alu_8bit |

## Results
| Image | Description |
|---|---|
| `results/a09_q1_usr_synth_vcs_log.png` | VCS pre-synthesis simulation log — USR |
| `results/a09_q1_usr_synth_gtkwave.png` | GTKWave waveform — USR |
| `results/a09_q2_alu_synth_vcs_log.png` | VCS pre-synthesis simulation log — ALU |
| `results/a09_q2_alu_synth_gtkwave.png` | GTKWave waveform — ALU |
| `results/a09_q3_seqdetector_schematic.png` | Synthesized RTL schematic — seq_detector |
| `results/a09_q3_seqdetector_simulation.png` | Simulation waveform — seq_detector |

### Key Synthesis Results (SAED32 RVT, ss0p95v125c)
| Design | Total Area | Total Dynamic Power | Critical Path Slack |
|---|---|---|---|
| seq_detector | 45.26 | 19.33 µW (+2.11 µW leakage) | 0.56 ns (MET) |
| alu_8bit | 363.90 | 26.05 µW (+9.69 µW leakage) | Unconstrained (12 logic levels) |

**Tools used:** Synopsys Design Compiler
