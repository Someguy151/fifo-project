module fifo #(
    // FIFO parameters
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16   // must be a power of 2 for ptr logic

) (
    // FIFO ports
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

    // FIFO status flags
    output logic full,
    output logic empty

);

    // Time scale
    timeunit 1ns; timeprecision 100ps;

    // Pointer width
    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

    // Internal state
    logic [ADDR_WIDTH-1:0] wr_ptr;
    logic [ADDR_WIDTH-1:0] rd_ptr; 
    logic last_op_was_read;

    // FIFO storage
    logic [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];

    // Write logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= '0;
        end else begin
            if (wr_en && !full) begin
                mem[wr_ptr] <= din;
                wr_ptr <= wr_ptr + 1;
            end
        end
    end

    // Read logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dout <= '0;
            rd_ptr <= '0;
        end else begin
            if (rd_en && !empty) begin
                dout <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end

    // Status logic
    // Simultaneous read/write is not supported
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            last_op_was_read <= 1'b1;
        end else if (rd_en && !wr_en && !empty) begin
            last_op_was_read <= 1'b1;
        end else if (wr_en && !rd_en && !full) begin
            last_op_was_read <= 1'b0;
        end
    end

    // Full/empty flag generation
    assign full  = (wr_ptr == rd_ptr) && !last_op_was_read;
    assign empty = (wr_ptr == rd_ptr) &&  last_op_was_read;
    
endmodule : fifo
