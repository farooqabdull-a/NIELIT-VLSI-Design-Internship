# CMOS Inverter — VTC, Noise Margin, Delay & Power Analysis

**NIELIT – NIT Calicut | Online Internship on Analog & Digital VLSI Design Flow (Batch 1) — Assignment 2**
**Author:** Farooq Abdulla

## Objective
Design a CMOS inverter with switching threshold **Vm = VDD/2**, confirmed via the Voltage Transfer Characteristic (VTC), then extract:
1. Noise Margin (NMH, NML)
2. Propagation Delay (Tplh, Tphl)
3. Rise Time and Fall Time
4. Dynamic and Static Power Consumption

Length was fixed and PMOS/NMOS widths were swept/tuned to center the VTC at VDD/2.

## Tools
LTspice — `.dc` sweep, `.step param`, `.tran`, and `.op` analyses.

## Results

| Parameter | Value |
|---|---|
| Vm (= Vdd/2) | 2.5 V |
| Noise Margin High (NMH) | 1.921 V |
| Noise Margin Low (NML) | 1.792 V |
| Tplh | 7.332 × 10⁻¹⁰ s |
| Tphl | 7.332 × 10⁻¹⁰ s |
| Rise Time | 1.458 × 10⁻⁹ s |
| Fall Time | 1.458 × 10⁻⁹ s |
| Dynamic Power | 0.000130 W |
| Static Power | −5.004 × 10⁻¹¹ W |

## Files
| File | Description |
|---|---|
| `NIELIT_Analog_Assignment_No_02.pdf` | Full assignment report (source document) |
| `01_schematic_and_VTC_sweep_Wp.png` | Inverter schematic with `.step param Wp` sweep and family of VTC curves |
| `02_schematic_and_VTC_midpoint_cursor.png` | Schematic + VTC with cursor marking Vm ≈ VDD/2 |
| `03_VTC_annotated_VIL_VIH_VOL_VOH_log.png` | Annotated VTC curve with VIL/VIH/VOL/VOH and SPICE log used to compute noise margins |
| `04_transient_waveform_Tplh_Tphl_log.png` | Vin & Vout transient overlay with propagation delay/rise/fall log |
| `05_dynamic_power_schematic_log.png` | Schematic + log for dynamic power measurement |
| `06_static_power_schematic_log.png` | Schematic + log for static power measurement |
