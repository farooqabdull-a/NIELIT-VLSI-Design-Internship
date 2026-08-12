# Differential Amplifier with Miller Compensation — DC & AC Response

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Assignment 5**
**Author:** Farooq Abdulla

## Objective
Extend the Assignment 4 differential-pair/current-mirror stage into a full two-stage structure with a PMOS common-source output driver (M8) and a Miller compensation network (R1 + C1), then characterize:
1. The large-signal DC transfer curve
2. The small-signal AC frequency response (gain, phase, and stability margin)

This circuit is a direct precursor to the final Two-Stage CMOS Op-Amp mini project (see `../06_TwoStage_CMOS_OpAmp_MiniProject`).

## Tools
LTspice — `.dc Vin+` sweep and `.ac dec` analysis.

## Circuit
- Differential pair: M1, M2 (NMOS, W=350n, L=180n, m=10)
- PMOS current-mirror load: M5, M6 (W=1300n, L=180n, m=10)
- NMOS tail/bias mirror: M3, M4 (W=350n, L=180n, m=10/30)
- Second-stage PMOS driver: M8 (W=1300n, L=180n)
- NMOS active load: M7 (W=350n, L=180n)
- Miller compensation: C1 = 1.05p, R1 = 64 Ω
- Output load: C2 = 10p
- Supply: 1.8 V, bias current I1 = 10 µA

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Assignment_No_05.pdf` | Full assignment report (source document) |
| `01_DC_sim_schematic.png` | Schematic with `.dc Vin+ 0 1.8` sweep directive |
| `02_DC_VTC_plot.png` | Large-signal DC transfer curve (Vout vs Vin+) |
| `03_AC_sim_schematic.png` | Schematic with `.ac dec` AC-analysis sources |
| `04_AC_bode_plot.png` | Small-signal gain/phase Bode plot showing compensation effect |
