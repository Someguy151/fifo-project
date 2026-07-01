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

## Current Features 

- Synthesizable synchronous FIFO
- Parameterized DATA_WIDTH
- Parameterized FIFO_DEPTH 
- Single clock interface
- Active-low synchronous reset
- Read enable
- Write enable
- Full flag
- Empty flag

## Project Status 

Current milestone: 

- Phase 1 -- Basic FIFO RTL 

Completed

- Repository structure
- Requirements document
- Architecture document
- FIFO RTL implementation (in progress)

Next milestone

- Directed verification testbench

## Repository Structure 

```plaintext
    rtl/        RTL source files
    tb/         Testbench
    docs/       Design documentation
    scripts/    Simulation/build scripts
    sim/        Simulation output
    fpga/       FPGA implementation files
```

## Architecture

### Docs

Detailed documentation can be found in:

- `docs/requirements.md` 
- `docs/architecture.md` 

## Toolchain

### Development Environment 

| Tool | Purpose |
| --- | --- |
| SystemVerilog | RTL Design |
| ModelSim | Simulation |
| Intel Quartus Prime | Synthesis |
| Git | Version |
| GitHub | Project Hosting |
| Terasic DE10-Nano | FPGA Target |

## Getting Started

Clone the repository 

```bash
git clone https://github.com/Someguy151/fifo-project.git
cd fifo-project
```

See the documentation in `docs/` for project requirements and architecture before examining the RTL.

## Building the Project 

Simulation instructions will be added during Phase 2 when the directed testbench is introduced.

## Results 

Simulation waveforms and FPGA images will be added in future phases.

## Future Work 

### Roadmap 

- [x] Requirements
- [x] Architecture
- [ ] FIFO RTL
- [ ] Directed Testbench
- [ ] Self-checking Scoreboard
- [ ] Assertions
- [ ] Functional Coverage
- [ ] Constrained-Random Verification
- [ ] UVM Testbench
- [ ] FPGA Demonstration

## References 

- IEEE SystemVerilog Language Reference Manual
- Intel Quartus documentation
- ModelSim User Guide

## License 

This project is released under the MIT License.
