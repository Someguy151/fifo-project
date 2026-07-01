# SystemVerilog FIFO Design and Verification

A synthesizable, parameterized synchronous FIFO implemented in SystemVerilog as part of a personal design verification portfolio project. 

## Project Overview 

This repository documents the development of a synchronous FIFO from a simple RTL implementation through increasingly advanced verification techniques.

It is intended to demonstrate practical digital design and design verification skills using industry-standard tools including:

- SystemVerilog
- ModelSim
- Intel Quartus
- Git
- GitHub

Future phases will introduce assertions, functional coverage, UVM, asynchronous FIFOs, and FPGA implementation. 

## Project Goals 

- Learn modern SystemVerilog design practices
- Practice verification methodologies
- Create a portfolio-quality GitHub project
- Target synthesis on the Terasic DE10-Nano FPGA
- Demonstrate incremental engineering development

## Features 

- Parameterized data width 
- Parameterized FIFO depth 
- Single clock
- Active-low reset
- Read/write enables
- Full flag
- Empty flag
- Synthesizable RTL 

## Project Status 

**Current Phase** 

- Phase 1 -- Basic FIFO RTL 

Upcoming

- Directed testbench
- Scoreboard
- Functional coverage
- Assertions
- FPGA validation
- UVM

## Repository Structure 

```plaintext
    rtl/
    tb/
    docs/
    scripts/
    sim/
    fpga/
```

## Architecture

### Docs

Detailed documentation can be found in:

- `docs/requirements.md` 
- `docs/architecture.md` 

## Toolchain

### Development Environment 

RTL Language  
- SystemVerilog

Simulator  
- ModelSim 

Synthesis 
- Intel Quartus Prime 

Target FPGA 
- Terasic DE10-Nano 

Version Control 
- Git 
- GitHub 

## Building the Project 

### Simulation 

Compile RTL 

Compile testbench 

Run simulation 

View waveforms 

## Screenshots 

- 

## Future Work 

### Roadmap 

- Scoreboard
- Functional coverage
- Assertions
- Randomized testing
- UVM
- Asynchronous FIFO
- VHDL implementation

## References 

- IEEE SystemVerilog Language Reference Manual
- Intel Quartus documentation
- ModelSim User Guide
