module fifo #(
    // fifo parameters
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16

) (
    // Fifo ports
    // ----------------------------

    // Clock and reset
    input logic clk,
    input logic rst_n,
    
    // Enable for both ports
    input logic wr_en,
    input logic rd_en,

    // Input and output data bus
    input logic  [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout,

    // Interface status outputs
    output logic full,
    output logic empty,

);

    // Time scale
    timeunit 1ns; timeprecision 100ps;

    // Pointer width
    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

    // Internal state
    logic [ADDR_WIDTH-1:0] wr_ptr;
    logic [ADDR_WIDTH-1:0] rd_ptr; 


    
endmodule : fifo
