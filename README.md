


# Analog & Digital VLSI Design & Verification

<div align="center">

![Verilog](https://img.shields.io/badge/VERILOG-HDL-0073B7?style=flat-square)
![SystemVerilog](https://img.shields.io/badge/SYSTEMVERILOG-VERIFICATION-00599C?style=flat-square)
![UVM](https://img.shields.io/badge/UVM-METHODOLOGY-2E7D32?style=flat-square)
![Vivado](https://img.shields.io/badge/VIVADO-XILINX-FF6600?style=flat-square)
![Synopsys](https://img.shields.io/badge/SYNOPSYS-VCS-5B2C6F?style=flat-square)
![Cadence](https://img.shields.io/badge/CADENCE-VIRTUOSO-CC0000?style=flat-square)
![LTspice](https://img.shields.io/badge/LTSPICE-ANALOG-003366?style=flat-square)

</div>

This repository consolidates all hands-on circuit design, RTL development, LTspice simulations, code coverage analysis, and synthesis work completed during the **Online Internship on Analog and Digital VLSI Design Flow (Batch 01)** hosted by **NIELIT – NIT Calicut**.

The repository is structured into two main tracks:
1. **Analog VLSI Design Flow**: Transistor-level characterization, amplifier stages, frequency response analysis, and a two-stage operational amplifier mini-project in LTspice.
2. **Digital VLSI Design & Verification**: RTL design, functional verification, testbenches, code coverage analysis, and logic synthesis using industry-standard EDA toolchains (Vivado, VCS, Design Compiler).

---

## 📁 Repository Architecture

```text
.
├── Analog_VLSI_Design/
│   ├── 01_CMOS_Inverter_VTC_Analysis/
│   ├── 02_PMOS_MOSFET_Characterization/
│   ├── 03_CS_Amplifier_PMOS_Resistive_Load/
│   ├── 04_CS_Amplifier_Diff_Pair_Frequency_Response/
│   ├── 05_CS_Amplifier_Current_Mirror_Load/
│   └── 06_TwoStage_CMOS_OpAmp_MiniProject/
│
└── Digital_VLSI_Design/
    ├── 01_Logic_Gates_and_MUX/
    ├── 02_Encoder_Comparator_Gray_Converter/
    ├── 03_BCD_Code_Converters/
    ├── 04_UpDown_Counter/
    ├── 05_Vivado_Testbenches/
    ├── 06_FSM_Sequence_Detector/
    ├── 07_VCS_Simulation/
    ├── 08_VCS_Coverage_Analysis/
    ├── 09_Logic_Synthesis/
    └── 10_VCS_Coverage_Analysis/

```

---

## 📐 Track 1: Analog VLSI Design (LTspice)

Focused on transistor sizing, DC/AC sweeps, transient behavior, noise analysis, and frequency compensation using **LTspice** and a **180 nm CMOS PDK**.

| # | Project Directory | Key Objectives & Concepts Covered |
| --- | --- | --- |
| 01 | [`01_CMOS_Inverter_VTC_Analysis`](https://www.google.com/search?q=./Analog_VLSI_Design/01_CMOS_Inverter_VTC_Analysis) | $V_m = V_{DD}/2$ sizing, VTC characterization, noise margins ($NM_L, NM_H$), propagation delay ($t_{pd}$), static/dynamic power. |
| 02 | [`02_PMOS_MOSFET_Characterization`](https://www.google.com/search?q=./Analog_VLSI_Design/02_PMOS_MOSFET_Characterization) | PMOS $I$-$V$ family curves, current-mirror resistor sizing, $180\text{ nm}$ PDK NMOS bias point determination. |
| 03 | [`03_CS_Amplifier_PMOS_Resistive_Load`](https://www.google.com/search?q=./Analog_VLSI_Design/03_CS_Amplifier_PMOS_Resistive_Load) | Common-Source gain & pole location analysis, Phase Margin ($PM$), Gain-Bandwidth Product ($GBW$), input-referred noise. |
| 04 | [`04_CS_Amplifier_Diff_Pair_Frequency_Response`](https://www.google.com/search?q=./Analog_VLSI_Design/04_CS_Amplifier_Diff_Pair_Frequency_Response) | NMOS differential pair with PMOS current mirror load, DC transfer sweep, AC Bode response. |
| 05 | [`05_CS_Amplifier_Current_Mirror_Load`](https://www.google.com/search?q=./Analog_VLSI_Design/05_CS_Amplifier_Current_Mirror_Load) | Two-stage amplifier extension with PMOS second stage driver and Miller frequency compensation. |
| 06 | [`06_TwoStage_CMOS_OpAmp_MiniProject`](https://www.google.com/search?q=./Analog_VLSI_Design/06_TwoStage_CMOS_OpAmp_MiniProject) | **Mini-Project:** Complete 180 nm Two-Stage Op-Amp design, transistor sizing, AC/DC/transient/slew-rate verification. |

### 🌟 Mini-Project Highlight: Two-Stage CMOS Op-Amp

Designed in $180\text{ nm}$ CMOS technology at $V_{DD} = 1.8\text{ V}$:

| Parameter | Target Spec | Achieved Result |
| --- | --- | --- |
| **DC Open-Loop Gain** | $\ge 60\text{ dB}$ | **$125\text{ dB}$** |
| **Gain-Bandwidth Product (GBW)** | $\le 1.0\text{ MHz}$ | **$1.0\text{ MHz}$** |
| **Phase Margin** | $\ge 60^\circ$ | **$88^\circ$** |
| **Slew Rate** | $\approx 5\text{ V/\mu s}$ | **$\approx 5\text{ V/\mu s}$** |
| **Power Consumption** | Minimize | **$126\text{ \mu W}$** |

---

## 💻 Track 2: Digital VLSI Design & Verification

Focused on Verilog HDL modeling, behavioral & structural logic design, self-checking testbenches, functional coverage metrics, and gate-level synthesis.

| # | Project Directory | Description & Verification Scope |
| --- | --- | --- |
| 01 | [`01_Logic_Gates_and_MUX`](https://www.google.com/search?q=./Digital_VLSI_Design/01_Logic_Gates_and_MUX) | Gate primitives, dataflow vs. structural modeling, 2:1 MUX in 6 modeling styles. |
| 02 | [`02_Encoder_Comparator_Gray_Converter`](https://www.google.com/search?q=./Digital_VLSI_Design/02_Encoder_Comparator_Gray_Converter) | 8:3 priority encoder, 4-bit magnitude comparator, 3-bit binary-to-Gray converter. |
| 03 | [`03_BCD_Code_Converters`](https://www.google.com/search?q=./Digital_VLSI_Design/03_BCD_Code_Converters) | BCD-to-Excess-3 and BCD-to-7-segment display decoder logic. |
| 04 | [`04_UpDown_Counter`](https://www.google.com/search?q=./Digital_VLSI_Design/04_UpDown_Counter) | 4-bit up/down counter featuring both synchronous and asynchronous reset modes. |
| 05 | [`05_Vivado_Testbenches`](https://www.google.com/search?q=./Digital_VLSI_Design/05_Vivado_Testbenches) | Simulation stimulus design: MUX, self-checking comparator, D-FF, up/down counter in Vivado. |
| 06 | [`06_FSM_Sequence_Detector`](https://www.google.com/search?q=./Digital_VLSI_Design/06_FSM_Sequence_Detector) | `'1001'` sequence detector designed and compared across Mealy and Moore state machines. |
| 07 | [`07_VCS_Simulation`](https://www.google.com/search?q=./Digital_VLSI_Design/07_VCS_Simulation) | Compile & waveform generation for 4-bit Universal Shift Register (USR) & 8-bit ALU using **Synopsys VCS** and **GTKWave**. |
| 08 | [`08_VCS_Coverage_Analysis`](https://www.google.com/search?q=./Digital_VLSI_Design/08_VCS_Coverage_Analysis) | Functional & code coverage metrics (Line, Toggle, Branch, Condition) generated via VCS `urg`. |
| 09 | [`09_Logic_Synthesis`](https://www.google.com/search?q=./Digital_VLSI_Design/09_Logic_Synthesis) | ASIC logic synthesis using **Synopsys Design Compiler** for USR, ALU, and `'10110'` sequence detector (timing/area/power mapping). |

---

## 🛠️ EDA Tools & Environment

* **Analog Design & Simulation:**
* **LTspice** (DC, AC, Transient, and Noise analyses)
* **180 nm CMOS PDK** & long-channel generic SPICE models


* **Digital Design & Verification:**
* **Xilinx Vivado** (RTL design & simulation)
* **Synopsys VCS & GTKWave** (High-performance simulation & waveform analysis)
* **Synopsys Design Compiler (DC)** (Logic synthesis & static timing mapping)



---

## 👨‍💻 Author

**Farooq Abdulla**

* **B.Tech** in Electronics and Communication Engineering
* **PG Diploma** in Advanced VLSI Design and Verification

```

```
