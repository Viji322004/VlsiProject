`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full;
wire empty;

// Instantiate FIFO
fifo uut (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// ✅ Add this clock generator here
always #5 clk = ~clk;  // toggles every 5 ns

// ✅ Add reset and stimulus here
initial begin
    clk = 0;
    reset = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    #10 reset = 0;  // release reset after 10 ns

    // Write data
    #10 wr_en = 1; data_in = 8'd10;
    #10 data_in = 8'd20;
    #10 data_in = 8'd30;
    #10 wr_en = 0;

    // Read data
    #10 rd_en = 1;
    #30 rd_en = 0;

    #200 $finish;
end

// ✅ Add waveform dump here
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, fifo_tb);
end

endmodule