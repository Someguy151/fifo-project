# FIFO Architecture

## 1. Overview

This project implements a synthesizable synchronous First-In, First-Out (FIFO) buffer memory in SystemVerilog.

## 2. Design Objectives 

Phase 1 goals:

- Fully synthesizable SystemVerilog RTL 
- Parameterized data width 
- Parameterized FIFO depth 
- Single clock domain 
- Simple and readable RTL 
- Clear separation between design and verification 
- FPGA compatible 

## 3. Functional Description 

A FIFO stores data in the order that it is received. 

- A write operation stores data at the current write pointer location. 
- A read operation retrieves the data from the current read pointer location. 
- The first value written is the first value read. 

The FIFO will not reorder or modify the stored data. 

## 4. Top-Level Interface 

| Signal | Direction | Description |
| --- | --- | --- |
| clk   | Input  | System clock |
| rst_n | Input  | Active-low reset |
| wr_en | Input  | Write enable  |
| rd_en | Input  | Read enable |
| din   | Input  | Data input |
| dout  | Output | Data output |
| full  | Output | Full indicator |
| empty | Output | Empty indicator |

## 5. Parameters 

| Parameter | Default | Description |
| --- | --- | --- |
| DATA_WIDTH | 8  | Width of each data word |
| FIFO_DEPTH | 16 | Number of storage locations |

## 6. Internal Architecture 

The FIFO is made up of four primary components: 

### Memory Array 

Stores data. 

```systemverilog
logic [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
```

### Write Pointer 

Tracks the next available write location. 

The pointer advances when: 

- `wr_en == 1`
- `full == 0` 

### Read Pointer 

Track the next location to read. 

The pointer advances when: 

- `rd_en == 1` 
- `empty == 0` 

### Status Logic 

Combinational logic generates: 

- Full flag
- Empty flag

These outputs prevent invalid writes/reads. 

## 7. Block Diagram 

```plaintext

                     +----------------------+
                     |      FIFO Module     |
                     |                      |
    din -----------> |                      |
    wr_en ---------> |                      | -----> dout
    rd_en ---------> |                      |
    clk -----------> |                      |
    rst_n ---------> |                      |
                     |                      |
                     |  +---------------+   |
                     |  | Memory Array  |   |
                     |  +---------------+   |
                     |         ^            |
                     |         |            |
                     |  Write Pointer       |
                     |  Read Pointer        |
                     |         |            |
                     |  Status Logic        |
                     +----------------------+
    
    Outputs:
        full
        empty 

```

## 8. Write Operation 

A write occurs when: 

- `wr_en` is asserted 
- the FIFO is not full 

Operation sequence: 

1. Store `din` into memory. 
2. Increment the write pointer. 
3. Update status flags. 

## 9. Read Operation 

A read occurs when: 

- `rd_en` is asserted 
- the FIFO is not empty 

Operation sequence: 

1. Read memory at the current read pointer. 
2. Drive `dout`
3. Increment the read pointer. 
4. Update the status flags.

## 10. Reset Behavior 

When `rst_n` is asserted low: 

- Write pointer resets to zero. 
- Read pointer resets to zero. 
- FIFO becomes empty.
- Full flag is cleared. 
- Output data is reset to a known value (depends on implementation?)

## 11. Design Assumptions 

The initial implementation assumes: 

- One shared clock for read and write operations. 
- No simultaneous clock-domain crossing. 
- No overflow or underflow reporting. 
- No proggrammable thresholds. 
- No error corrections. 
- No almost-full or almost-empty flags. 

May add some of these capabilities to later project phases. 

## 12. Planned Enhancements 

Future revisions are expected to add: 

- Occupancy counter
- Almost-full flag
- Almost-empty flag
- Overflow and underflow detection
- Assertions (SV Assertions)
- Functional coverage
- Scoreboard-based verification
- UVM testbench
- Asynchronous FIFO implementation
- FPGA demo on the DE10-Nano

## 13. Verification Strategy (Phase 1) 

Verification will use a directed, non-UVM SystemVerilog testbench. 

Initial test cases include: 

- Reset verification
- Single write/read
- Multiple writes
- Multiple reads
- Fill FIFO
- Empty FIFO
- 


Wveforms and self-checking tests will be used to confirm correct operation. 

## 14. Revision History 

| Version | Date | Description | 
| ---- | ---- | ----  |
| 0.1 | Initial release | Phase 1 synchronous FIFO architecture |
