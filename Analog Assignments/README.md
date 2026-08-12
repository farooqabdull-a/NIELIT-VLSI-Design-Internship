# Analog & Digital VLSI Design — NIELIT NIT Calicut Internship

This repository contains circuit design, LTspice simulation, and analysis work completed during the **Online Internship on Analog and Digital VLSI Design Flow (Batch 1)** at **NIELIT – NIT Calicut**.

All designs are simulated in **LTspice**, progressing from single-transistor characterization through amplifier stages to a complete two-stage operational amplifier — each folder is self-contained with the original assignment PDF, extracted schematics/plots, and a README summarizing objectives, methodology, and results.

## Contents

| # | Project | Summary |
|---|---|---|
| 01 | [CMOS Inverter — VTC, Noise Margin, Delay & Power](./01_CMOS_Inverter_VTC_Analysis) | Vm = VDD/2 design, VTC characterization, noise margins, propagation delay, dynamic/static power |
| 02 | [PMOS/NMOS MOSFET Characterization](./02_PMOS_MOSFET_Characterization) | PMOS I-V curve families, current-mirror resistor sizing, 180nm PDK NMOS bias point |
| 03 | [CS Amplifiers — PMOS Load & Resistive Load](./03_CS_Amplifier_PMOS_Resistive_Load) | Gain/pole analysis, phase margin, gain-bandwidth product, input-referred noise |
| 04 | [Differential Pair — DC Transfer & Frequency Response](./04_CS_Amplifier_Diff_Pair_Frequency_Response) | NMOS diff pair + PMOS mirror load, DC sweep and AC Bode response |
| 05 | [Two-Stage Diff Amp with Miller Compensation](./05_CS_Amplifier_Current_Mirror_Load) | Adds second-stage PMOS driver + Miller compensation network |
| 06 | [Two-Stage CMOS Op-Amp — Mini Project](./06_TwoStage_CMOS_OpAmp_MiniProject) | Full op-amp design: sizing, DC/AC/transient/noise verification. 125 dB gain, 88° phase margin, ~5 V/µs slew rate |

## Highlight — Mini Project Results

Two-stage CMOS op-amp (180 nm, 1.8 V supply):

| Parameter | Target | Achieved |
|---|---|---|
| DC Open-Loop Gain | ≥ 60 dB | **125 dB** |
| Gain-Bandwidth Product | ≤ 1 MHz | **1.0 MHz** |
| Phase Margin | ≥ 60° | **88°** |
| Slew Rate | ≈ 5 V/µs | **≈ 5 V/µs** |
| Power Consumption | Minimize | **126 µW** |

See [`06_TwoStage_CMOS_OpAmp_MiniProject`](./06_TwoStage_CMOS_OpAmp_MiniProject) for the full design writeup.

## Tools Used
- **LTspice** — DC/AC/transient/noise simulation
- **180 nm CMOS PDK** (mini project, Assignment 1 Q3) and generic long-channel models (earlier assignments)

## Author
**Farooq Abdulla**
B.Tech, Electronics and Communication Engineering
PG Diploma in Advanced VLSI Design and Verification — IBIS Academy, Kochi
