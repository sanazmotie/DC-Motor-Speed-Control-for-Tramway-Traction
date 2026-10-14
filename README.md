# DC-Motor-Speed-Control-for-Tramway-Traction
This project focuses on the modeling, control, and simulation of a separately excited DC motor drive for tramway traction applications. It was developed as part of the Dynamics of Electrical Machines and Drives course at Politecnico di Milano during the 2025–2026 academic year.

The objective is to design a closed-loop control system that tracks the reference vehicle speed while managing the motor's electrical and mechanical dynamics under different operating conditions.

## Project Objectives

- Develop a mathematical model of a separately excited DC motor.
- Implement the motor and vehicle dynamics in MATLAB/Simulink.
- Design and tune PI controllers for armature current, excitation current, and motor speed.
- Implement voltage and torque saturation limits to respect the drive's operating constraints.
- Apply field weakening to enable operation above the motor's base speed.
- Simulate the complete drive system and evaluate the reference and measured responses.

## System Description

The simulated drive consists of a separately excited DC motor, a mechanical load model representing the tramway vehicle, and three closed-loop control systems:

- **Armature Current Control:** Regulates the armature current and limits the commanded armature voltage according to the available DC bus voltage and back electromotive force.
- **Speed Control:** Regulates motor speed by generating the reference electromagnetic torque, subject to torque saturation limits.
- **Excitation Current Control:** Regulates the excitation current and adjusts the magnetic flux during field-weakening operation.

The mechanical load model accounts for vehicle mass, road slope, and viscous friction.

## Control Strategy

The three PI controllers were tuned using MATLAB's `pidtune` function. The control loops were designed with different crossover frequencies to reflect the dynamics of the electrical and mechanical subsystems.

The drive operates in two main regions:

1. **Constant-Flux Region:** The excitation current remains at its rated value.
2. **Field-Weakening Region:** Above the motor's base speed, the excitation current is reduced to decrease the magnetic flux and allow higher-speed operation while respecting the armature voltage limit.

## Simulation Results

The simulation results include comparisons between reference and measured values for:

- Vehicle speed
- Excitation current
- Armature current

The results illustrate the drive's response to the reference speed profile and the reduction in excitation current during field-weakening operation.

## Academic Context

**Course:** Dynamics of Electrical Machines and Drives  
**Institution:** Politecnico di Milano  
**Academic Year:** 2025–2026

