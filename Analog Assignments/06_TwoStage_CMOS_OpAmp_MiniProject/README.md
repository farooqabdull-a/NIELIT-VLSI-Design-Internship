# Two-Stage CMOS Operational Amplifier — Mini Project

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Mini Project**
**Author:** Farooq Abdulla

## Overview
Full design, sizing, and verification of a two-stage CMOS op-amp in a 180 nm process, built up from the building blocks explored in Assignments 4 and 5.

**Topology:**
- **Stage 1 (Diff-to-Single-Ended):** NMOS differential pair (M1, M2) with PMOS active current-mirror load (M3, M4); NMOS tail current mirror (M5)
- **Stage 2 (High-Gain Output):** Common-source PMOS driver (M8) with NMOS active-load current mirror (M7)
- **Frequency Compensation:** Miller network — capacitor C1 in series with nulling resistor R1, spanning the second stage

## Design Methodology
Hand-derived from first-order square-law equations:
- Compensation capacitor sized from the `C1 ≥ 0.22·C_L` rule of thumb, tuned to 4.7 pF to hit GBW = 1 MHz exactly
- Tail current (10 µA) derived from the target slew rate (SR ≈ 5 V/µs)
- Input-pair transconductance g_m1 set by GBW and C1, giving (W/L)₁,₂ ≈ 0.29 → scaled to 15 µm/1.5 µm for robustness
- Second-stage g_m8 sized so the non-dominant pole sits ≥ 3× GBW
- Nulling resistor R1 = 2.5 kΩ moves the feedforward RHP zero into the LHP for phase lead

Full transistor sizing table, DC operating-point verification (saturation check for all 8 devices), pole-zero derivation, and input-referred noise analysis are included in the PDF report.

## Tools
LTspice — `.op`, `.ac dec 100 1 1G`, `.tran`, `.noise` — 180 nm process parameters.

## Results — Performance Summary

| Parameter | Target Spec | Simulated | Verdict |
|---|---|---|---|
| DC Open-Loop Gain (A_DC) | ≥ 60 dB | 125 dB | ✅ PASSED |
| Gain-Bandwidth Product (GBW) | ≤ 1 MHz | 1.0 MHz | ✅ PASSED |
| Phase Margin (PM) | ≥ 60° | 88° | ✅ PASSED |
| Slew Rate (SR) | ≈ 5 V/µs | ≈ 5 V/µs | ✅ PASSED |
| Load Capacitance (C_L) | 10 pF | 10 pF | Fixed |
| Supply Voltage (V_DD) | 1.8 V | 1.8 V | Fixed |
| Total Power Consumption | Minimize | 126 µW | Highly Optimized |

### Final Transistor Sizing

| Transistor | Type | W | L | W/L | I_D |
|---|---|---|---|---|---|
| M1, M2 | NMOS | 15.0 µm | 1.5 µm | 10 | 5.0 µA |
| M3, M4 | PMOS | 22.5 µm | 1.5 µm | 15 | 5.0 µA |
| M5, M6 | NMOS | 30.0 µm | 1.5 µm | 20 | 10.0 µA |
| M7 | NMOS | 150.0 µm | 1.5 µm | 100 | 50.0 µA |
| M8 | PMOS | 225.0 µm | 1.5 µm | 150 | 50.0 µA |

Compensation: C1 = 4.7 pF, R1 = 2.5 kΩ · Load: C2 = 10 pF

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Mini_Project.pdf` | Full mini-project report — design derivation, sizing tables, DC/AC/transient/noise analysis, pole-zero calculations |
| `01_circuit_schematic_LTspice.png` | Complete two-stage op-amp schematic with Miller compensation network |
| `02_AC_bode_plot_gain_phase.png` | Open-loop AC response — 125 dB DC gain, 1 MHz GBW, 88° phase margin |
| `03_transient_slew_rate_waveform.png` | Large-signal transient step response used to extract slew rate |
| `04_input_referred_noise_plot.png` | Input-referred noise spectral density (thermal + flicker) |
