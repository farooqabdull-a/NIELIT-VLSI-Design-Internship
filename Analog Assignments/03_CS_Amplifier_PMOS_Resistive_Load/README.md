# Common-Source Amplifiers — PMOS Active Load & Resistive Load

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Assignment 3**
**Author:** Farooq Abdulla

## Objective

**Q1 — PMOS-load Common-Source Amplifier:**
Design a CS amplifier with a PMOS active (diode/current-source) load, calculate gain and dominant pole location analytically, then verify against the simulated gain-vs-frequency plot. Mark the unity-gain frequency and determine phase margin.

**Q2 — Resistive-load Common-Source Amplifier:**
Design a resistive-load CS amplifier for a target gain of **−5 V/V**, driving a 100 fF load capacitance.
a) DC, AC, and transient simulations to verify the gain
b) AC analysis for gain, bandwidth, gain-bandwidth product, and poles/zeros
c) Noise analysis to extract input-referred voltage noise

## Tools
LTspice — `.op`, `.ac dec`, `.tran`, `.noise` analyses.

## Results

### Q1 — PMOS-load CS Amplifier
| Parameter | Value | Notes |
|---|---|---|
| DC / Midband Gain (A_v) | 8.3 dB | Flat region, 1 Hz–10 kHz |
| Dominant Pole (f_p) | 300 kHz | Phase = 135°, Gain = 5.3 dB |
| Unity Gain Frequency (UGF) | 750 kHz | 0 dB crossover |
| Phase at UGF | 90° | |
| Phase Margin | 90° | Excellent stability |

### Q2 — Resistive-load CS Amplifier
| Parameter | Value |
|---|---|
| Low-Frequency Gain | ~11.5 dB (~3.76 V/V) |
| Bandwidth (−3 dB) | ~2 GHz |
| Gain-Bandwidth Product | ~7.52 GHz |
| Dominant Pole | ~2 GHz |
| Zeros | None |
| Input-Referred Voltage Noise | ~41.6 pV/√Hz |

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Assignment_No_03.pdf` | Full assignment report (source document) |
| `01_Q1_PMOS_load_CS_amp_schematic.png` | Q1 schematic — PMOS active-load CS amplifier |
| `02_Q1_gain_vs_frequency_plot.png` | Q1 Bode plot with gain and phase, UGF & phase margin |
| `03_Q2_DC_sim_schematic_op_point.png` | Q2 DC operating point schematic + SPICE log |
| `04_Q2_AC_sim_schematic.png` | Q2 AC analysis schematic |
| `05_Q2_AC_bode_plot.png` | Q2 gain/phase Bode plot |
| `06_Q2_transient_sim_schematic.png` | Q2 transient analysis schematic |
| `07_Q2_transient_plot.png` | Q2 Vin/Vout transient waveform overlay |
| `08_Q2_noise_sim_schematic.png` | Q2 noise analysis schematic |
| `09_Q2_noise_plot.png` | Q2 output & device noise spectral density plot |
