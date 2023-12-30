# Variables
RTL_DIR := rtl/
VERILOG_FILE := rtl/top_module.v
TEST_BENCH := test_bench/tb_top_module.v
MEM_FILE := programs/memory.out
PYTHON_SCRIPT := programs/align.py
WAVEFORM_VIEWER := gtkwave

# Targets
all: init core

init:
	@echo "Initializing..."
	sudo apt update
	sudo apt install -y iverilog gtkwave

core:
	@echo "Cleaning the log files..."
	rm -f output.vvp waveform.vcd core.vvp *_tb.vvp *.log
	@echo "Aligning the Memory to Little Endian..."
	python3 $(PYTHON_SCRIPT)	
	@echo "Compiling Verilog files..."
	iverilog -o output.vvp $(TEST_BENCH) $(VERILOG_FILE)
	vvp output.vvp
	@echo "Generating waveform..."
	gtkwave waveform.vcd &
	cat base_register_file.log
	cat data_memory.log

compile: $(TB) $(DESIGN)
	@echo "Compiling Verilog files..."
	iverilog -o output.vvp $(TB) $(DESIGN)
	vvp output.vvp
	@echo "Generating waveform..."
	gtkwave waveform.vcd

clean:
	@echo "Cleaning up..."
	rm -f *.vvp *.log *.vcd

.PHONY: all core compile clean

