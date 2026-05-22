# VlsiProject
# Synchronous FIFO
# Project Overview
This project implements a simple synchronous FIFO (First-In First-Out) memory using Verilog HDL.

# The FIFO supports:
•	Synchronous write operation

•	Synchronous read operation

•	Full and empty status detection

•	Waveform verification using GTKWave

# FIFO Features
•	FIFO Depth: 8

•	Data Width: 8-bit

•	Single clock operation

•	Reset functionality

•	Full and Empty flag generation

# Tools Used
•	Verilog HDL

•	Icarus Verilog

•	GTKWave

•	VS Code

# Project Files
•	"fifo.v" → FIFO design module

•	"fifo_tb.v" → Testbench for simulation

•	"waveform.vcd" → Generated waveform file

# Simulation Steps
•	Compile - iverilog -o fifo_out fifo.v fifo_tb.v

•	Run Simulation - vvp fifo_out

•	Open Waveform - gtkwave waveform.vcd

# Waveform Explanation
1.	"clk" - toggles every 5ns
2.	"wr_en" -  enables FIFO write operation
3.	"rd_en" - enables FIFO read operation
4.	"data_in" - stores input data into FIFO
5.	"data_out" - reads stored data in FIFO order
6.	"full" -  becomes HIGH when FIFO is full
7.	"empty" -  becomes HIGH when FIFO is empty

# Learning Outcome
Through this project, I learnt:

•	Verilog RTL design

•	FIFO memory concepts

•	Clock-based synchronous operation

•	Simulation using Icarus Verilog

•	Waveform analysis using GTKWave.

