# VLSI Design & Verification — NIELIT Calicut Internship Projects

This repository contains RTL design code, testbenches, schematics, and simulation/coverage/synthesis results from a series of Verilog HDL projects completed during an **Online Internship on Analog and Digital VLSI Design Flow (Batch 01)** at NIELIT Calicut.

Tools used across the projects: **Xilinx Vivado**, **Synopsys VCS**, **GTKWave**, and **Synopsys Design Compiler**.

## Repository Structure

Each project lives in its own numbered folder, structured as:

```
XX_Project_Name/
├── README.md          # Project-specific overview
├── rtl/                # RTL design source files (.v)
├── testbench/           # Testbench source files (.v)
├── results/             # Schematic & simulation/coverage screenshots (.png)
└── reports/              # (where applicable) synthesis area/power/timing reports (.txt)
```

## Projects

| # | Folder | Topic |
|---|---|---|
| 01 | [01_Logic_Gates_and_MUX](./01_Logic_Gates_and_MUX) | Fundamental logic gates (dataflow & structural) + 2:1 MUX (6 modeling styles) |
| 02 | [02_Encoder_Comparator_Gray_Converter](./02_Encoder_Comparator_Gray_Converter) | 8:3 encoder, 4-bit magnitude comparator, 3-bit binary-to-Gray converter |
| 03 | [03_BCD_Code_Converters](./03_BCD_Code_Converters) | BCD-to-Excess-3 and BCD-to-seven-segment converters |
| 04 | [04_UpDown_Counter](./04_UpDown_Counter) | 4-bit up/down counter — synchronous & asynchronous reset |
| 05 | [05_Vivado_Testbenches](./05_Vivado_Testbenches) | Testbench design in Vivado: MUX, self-checking comparator, D-FF, up/down counter |
| 06 | [06_FSM_Sequence_Detector](./06_FSM_Sequence_Detector) | '1001' sequence detector — Mealy vs. Moore FSM |
| 07 | [07_VCS_Simulation](./07_VCS_Simulation) | 4-bit universal shift register & 8-bit ALU — Synopsys VCS + GTKWave |
| 08 | [08_VCS_Coverage_Analysis](./08_VCS_Coverage_Analysis) | Functional coverage (line/toggle/branch/condition) for USR & ALU |
| 09 | [09_Synthesis_DesignCompiler](./09_Synthesis_DesignCompiler) | Logic synthesis (Design Compiler) — USR, ALU, and '10110' sequence detector |
| 10 | [Automatic Railway Level Crossing Controller](./Automatic_Railway_Level_Crossing_Controller) | Design and verify a fail-safe Moore FSM–based railway crossing controller in Verilog — covering RTL design, self-checking verification with coverage, and logic synthesis with timing/area/power analysis. |

## Author
**Farooq Abdulla**
B.Tech, Electronics and Communication Engineering
PG Diploma in Advanced VLSI Design and Verification
