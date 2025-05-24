#  Heat Transfer Project

 **Alexandria University – Faculty of Engineering**  
 **Ahmed M. Bsher** – Mechanical Engineering

---

##  Project Overview

This project consists of two main heat conduction problems (Q1 & Q2), solved using MATLAB.  
It covers both **steady-state** and **transient** scenarios with internal heat generation and varying boundary conditions.

---

##  Question Breakdown

### 🔹 Q1: Steady-State Heat Conduction

- A 1D plate with internal heat generation.
- Boundary conditions:
  - Left side: **Convection + Radiation**
  - Right side: **Insulated**
- Solved using:
  -  Analytical method
  -  Finite Difference Method (FDM)
  -  MATLAB implementation (`Q1.m`)
- Result: Temperature distribution plotted in `plot.jpg`

---

### 🔹 Q2: Transient Heat Conduction

- Time-dependent heating of a plate initially at uniform temperature.
- Solved using:
  -  Explicit Finite Difference Time-Stepping
  -  MATLAB implementation (`Q2.m`)
  -  Results tabulated and visualized in Excel (`mat.xlsx`)
- Output figures:  
  - `q2 figure1.jpg` – Temperature vs. Time  
  - `q2 figure2.jpg` – Temperature vs. Position (Nodes)

---

##  Key Learnings

- Applying thermal boundary conditions programmatically.
- Using MATLAB to solve PDEs iteratively.
- Comparing analytical and numerical results.
- Time-domain simulation using explicit schemes.
- Data visualization using MATLAB and Excel.

---

##  MATLAB Files

- `Q1/Q1.m`: Solves the steady-state conduction problem.
- `Q2/Q2.m`: Solves the transient conduction problem with time steps.

---

##  MATLAB Implementation

Two separate implementations:
- `heat_transfer.m` — for steady-state solution (Problem 1)
- `transient_heat.m` — for transient heat conduction (Problem 2)

---

##  Repository Structure

```
HEAT_TRANSFER_PROJECT/
├── Q1/
│   ├── Q1.m                  # MATLAB code for Question 1 (steady-state)
│   └── plot.jpg              # Plot for Q1 temperature distribution
│
├── Q2/
│   ├── Q2.m                  # MATLAB code for Question 2 (transient)
│   ├── mat.xlsx              # Excel data file for Q2
│   ├── q2 figure1.jpg        # First figure (time vs. temperature)
│   └── q2 figure2.jpg        # Second figure (node evolution)
│
├── HEAT Project.pdf          # Full technical report
└── README.md                 # Documentation file
```

---


---

##  Sample Output Previews

> You can find these images in the respective folders:

- 📈 `Q1/plot.jpg`: Steady-state temperature distribution
- 📉 `Q2/q2 figure1.jpg`: Time vs. Temperature
- 📊 `Q2/q2 figure2.jpg`: Node Temperature Evolution

---

##  Resources

- 📄 `HEAT Project.pdf`: Full report with derivations, equations, and results.
- 📂 `Q1`, `Q2`: Separated folders for each question, including MATLAB code and plots.
- 📊 `mat.xlsx`: Data used for visualization and analysis in Q2.

---

##  Contact

**Ahmed M. Bsher**  
📧 ahmedbsher999@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/ahmed-bsher-921242232/)  
🌐 [Portfolio Website](https://ahmedbsher.github.io/My-Portfolio/)

---

##  Tags

`#MechanicalEngineering` `#HeatTransfer` `#MATLAB` `#NumericalMethods`  
`#FiniteDifference` `#StudentProject` `#EngineeringSimulation` `#FDM` `#TransientAnalysis`
