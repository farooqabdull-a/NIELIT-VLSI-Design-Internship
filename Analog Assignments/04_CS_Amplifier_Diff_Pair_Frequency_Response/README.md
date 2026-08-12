# Differential-Pair First Stage — DC Transfer & Frequency Response

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Assignment 4**
**Author:** Farooq Abdulla

## Objective
Simulate the first-stage building block later reused in the two-stage op-amp: an NMOS differential pair (M1, M2) with a PMOS current-mirror load (M5, M6) and an NMOS tail/mirror bias network (M3, M4). Characterize:
1. The large-signal DC transfer curve (single-ended output vs. differential input sweep)
2. The small-signal AC frequency response (gain and phase vs. frequency)

## Tools
LTspice — `.dc Vin+` sweep and `.ac dec` analysis.

## Circuit
- Differential pair: M1, M2 (NMOS, W=350n, L=180n)
- PMOS current-mirror load: M5, M6 (W=1300n, L=180n, m=10)
- NMOS tail/bias mirror: M3, M4 (W=350n, L=180n)
- Output compensation capacitor C1 = 1.05p
- Supply: 1.8 V, tail bias current source I1 = 10 µA

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Assignment_No_04.pdf` | Full assignment report (source document) |
| `01_DC_sim_schematic.png` | Schematic with `.dc Vin+ 0 1.8` sweep directive |
| `02_DC_VTC_plot.png` | Large-signal DC transfer curve (Vout vs Vin+) |
| `03_AC_sim_schematic.png` | Schematic with `.ac dec` AC-analysis sources |
| `04_AC_bode_plot.png` | Small-signal gain/phase Bode plot |
