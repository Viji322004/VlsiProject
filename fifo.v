`timescale 1ns/1ps

module fifo (
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

    reg [7:0] mem [0:7];   // 8-depth FIFO
    reg [2:0] wr_ptr;      // write pointer
    reg [2:0] rd_ptr;      // read pointer
    reg [3:0] count;       // number of elements

    assign full  = (count == 8);
    assign empty = (count == 0);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;
            data_out <= 0;
        end else begin
            // Write
            if (wr_en && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
                count  <= count + 1;
            end
            // Read
            if (rd_en && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                count  <= count - 1;
            end
        end
    end

endmodule