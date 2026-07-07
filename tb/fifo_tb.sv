`timescale 1ns/100ps

module fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 16;

    // DUT Signals -------------------------
    // Clock and reset
    logic clk,
    logic rst_n,
    // Enable for both ports
    logic wr_en,
    logic rd_en,
    // Input and output data bus
    logic [DATA_WIDTH-1:0] din,
    logic [DATA_WIDTH-1:0] dout,
    // FIFO status flags
    logic full,
    logic empty

    // FIFO DUT instantiation 
    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) dut ( );

    
endmodule