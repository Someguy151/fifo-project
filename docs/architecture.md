# FIFO Architecture

## 1. Overview

This project implements a synthesizable synchronous First-In, First-Out (FIFO) buffer memory in SystemVerilog.

*** 

## 2. Design Objectives 

Phase 1 goals:

- Fully synthesizable SystemVerilog RTL 
- Parameterized data width 
- Parameterized FIFO depth 
- Single clock domain 
- Simple and readable RTL 
- Clear separation between design and verification 
- FPGA compatible 

*** 

## 3. Functional Description 

A FIFO stores data in the order that it is received. 

- A write operation stores data at the current write pointer location. 
- A read operation retrieves the data from the current read pointer location. 
- The first value written is the first value read. 

The FIFO will not reorder or modify the stored data. 

*** 

## 4. Top-Level Interface 

| Signal | Direction | Description |
| --- | --- | --- |
| clk | Input | System clock |
