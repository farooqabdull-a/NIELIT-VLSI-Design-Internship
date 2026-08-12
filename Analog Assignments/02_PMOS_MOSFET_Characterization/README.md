# MOSFET Characterization — PMOS I-V Curves, Current Mirror & 180nm NMOS Bias

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Assignment 1**
**Author:** Farooq Abdulla

## Objective
1. **Q1:** Characterize a discrete PMOS device — plot I_D vs V_DS for a family of V_GS values, and I_D vs V_GS for a family of V_DS values.
2. **Q2(b):** Design a PMOS current mirror and determine the resistor value required to set a 20 µA reference/mirrored current.
3. **Q3:** Bias a 180 nm NMOS device (foundry PDK model) and verify the DC operating point.

## Tools
LTspice — `.dc` sweeps, `.tran`, `.op`, and a foundry 180 nm PDK model (`180nm.pm`).

## Results
- **Q2(b):** Reference resistor value = **222.305 kΩ** to establish the 20 µA mirrored current (confirmed: Id(M2) ≈ 19.9998 µA).
- **Q3:** DC operating point of the 180 nm NMOS extracted directly from the SPICE log at V_GS = 1 V, V_DS = 1.8 V.

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Assignment_No_01.pdf` | Full assignment report (source document) |
| `01_Q1_PMOS_VDS_vs_ID_family.png` | PMOS I_D–V_DS curve family for varying V_GS |
| `02_Q1_PMOS_VGS_vs_ID_family.png` | PMOS I_D–V_GS curve family for varying V_DS |
| `03_Q2b_PMOS_current_mirror_circuit.png` | PMOS current mirror schematic with reference resistor sizing |
| `04_Q3_NMOS180_schematic_op_point.png` | 180nm NMOS schematic with operating-point voltage/current table |
| `05_Q3_spice_log_output.png` | Full SPICE simulation log for the 180nm NMOS bias point |
