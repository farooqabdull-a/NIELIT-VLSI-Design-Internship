# Assignment 08 — Coverage Generation and Analysis using Synopsys VCS

## Overview
Functional coverage analysis (Line, Toggle, Branch, Condition) performed on the same USR and ALU designs from Assignment 07, using Synopsys VCS with Unified Coverage Reporting (URG).

- **Q1:** USR coverage — Line coverage 97.96%, Toggle coverage 82.14%, overall score 90.05.
- **Q2:** ALU coverage — Line coverage 98.63%, Toggle coverage 92.86%, overall score 95.74.

## Files
| Path | Description |
|---|---|
| `rtl/usr_4bit.v` | 4-bit universal shift register (same design as Assignment 07) |
| `rtl/alu_8bit.v` | 8-bit ALU (same design as Assignment 07) |
| `testbench/tb_usr_4bit.v` | USR testbench |
| `testbench/tb_alu_8bit.v` | ALU testbench |

## Results
| Image | Description |
|---|---|
| `results/a08_q1_usr_vcs_terminal_log.png` | VCS terminal log — USR simulation run |
| `results/a08_q1_usr_tb_line_coverage.png` | Line coverage — testbench (100%) |
| `results/a08_q1_usr_module_line_coverage.png` | Line coverage — USR module (87.50%) |
| `results/a08_q1_usr_toggle_coverage.png` | Toggle coverage report — USR |
| `results/a08_q1_usr_dashboard_summary.png` | Unified coverage dashboard — USR (score 90.05) |
| `results/a08_q2_alu_vcs_terminal_log.png` | VCS terminal log — ALU simulation run |
| `results/a08_q2_alu_dashboard_summary.png` | Unified coverage dashboard — ALU (score 95.74) |
| `results/a08_q2_alu_tb_line_coverage.png` | Line coverage — testbench (100%) |
| `results/a08_q2_alu_toggle_coverage.png` | Toggle coverage report — ALU module |
| `results/a08_q2_alu_toggle_details.png` | Toggle coverage port-level details — ALU |

**Tools used:** Synopsys VCS + URG (Unified Report Generator)
