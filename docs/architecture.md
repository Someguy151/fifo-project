# FIFO Architecture

## 1. Overview

This project implements a synthesizable synchronous First-In, First-Out (FIFO) buffer memory in SystemVerilog.

The FIFO is implemented using a parameterized memory array, independent read and write pointers, and status logic that determines the full and empty conditions. All read and write operations occur synchronously on the rising edge of the system clock.

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

The FIFO is composed of the following architectural components: 

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

Tracks the next location to read. 

The pointer advances when: 

- `rd_en == 1` 
- `empty == 0` 

**Pointer Width** 

Pointer width is derived from `FIFO_DEPTH` and is sufficient to address every storage location.

### Status Logic 

Status logic determines whether the FIFO is empty or full by monitoring the current state of the FIFO. The implementation may use pointer comparisons or other equivalent techniques.

Combinational logic generates: 

- Full flag
- Empty flag

These outputs prevent invalid writes/reads. 

### Control Logic 

Control logic is responsible for:

- qualifying read/write operations
- updating pointers
- updating status flags

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
                     |   Write Pointer      |
                     |    Read Pointer      |
                     |         |            |
                     |    Status Logic      |
                     |   Control Logic      |
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

## 10. Simultaneous Read/Write

Simultaneous read and write requests may occur on the same clock cycle. Their behavior is defined by the RTL implementation and corresponding requirements specification.

## 11. Reset Behavior 

When `rst_n` is asserted low: 

- Write pointer resets to zero. 
- Read pointer resets to zero. 
- FIFO becomes empty.
- Full flag is cleared. 
- `dout` is implementation-defined and should not be considered valid until a successful read occurs.

## 12. Design Assumptions 

The initial implementation assumes: 

- One shared clock for read and write operations. 
- No simultaneous clock-domain crossing. 
- No overflow or underflow reporting. 
- No programmable thresholds. 
- No error corrections. 
- No almost-full or almost-empty flags. 

May add some of these capabilities to later project phases. 

## 13. Planned Enhancements 

Future revisions are expected to add: 

**RTL Features** 

- Occupancy counter
- Almost-full flag
- Almost-empty flag
- Overflow detection
- Underflow detection

**Verification** 

- Assertions
- Functional coverage
- Scoreboard
- UVM environment

**Hardware** 

- FPGA demo on the DE10-Nano

## 14. Verification Strategy (Phase 1) 

Verification will use a directed, non-UVM SystemVerilog testbench. 

- Self-checking testbench
- Directed stimulus
- Waveform inspection for debugging

Initial test cases include: 

- Reset verification
- Single write/read
- Multiple writes
- Multiple reads
- Fill FIFO
- Empty FIFO

## 15. Revision History 

| Version | Date | Description | 
| ---- | ---- | ----  |
| 0.1 | June 29, 2026 | Initial Phase 1 architecture document |
| 0.2 | July 2, 2026 | Architecture reviewed |
