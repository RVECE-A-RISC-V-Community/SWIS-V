# Variables
RTL_DIR := rtl/
VERILOG_FILE := rtl/top_module.v
TEST_BENCH := test_bench/tb_top_module.v
MEM_FILE := programs/memory.out
PYTHON_SCRIPT := programs/align.py
WAVEFORM_VIEWER := gtkwave
GCC := $PWD/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objdump-gcc
OBJDUMP := $PWD/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objdump-objdump 
# Targets
all: init core

init:
	@echo "Initializing..."
	sudo apt update
	sudo apt install -y iverilog gtkwave
	@echo "Downloading RISCV-GCC toolchain.."
	@if [ -e riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz ]; then \
        echo "riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz already exists. Skipping wget"; \
    	else \
	wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz; \
	fi
	tar -zxvf riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz 
	

core: memory.out 
	@echo "Cleaning the log files..."
	rm -f output.vvp waveform.vcd core.vvp *_tb.vvp *.log
	@echo "Aligning the Memory to Little Endian..."
	python3 $(PYTHON_SCRIPT)	
	@echo "Compiling Verilog files..."
	iverilog -o output.vvp $(TEST_BENCH) $(VERILOG_FILE)
	vvp output.vvp
	@echo "Generating waveform..."
	gtkwave waveform.vcd &
	
memory.out:
	@echo "Compiling the program file..."
	./riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-as -o programs/program.o programs/$(program)
	./riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objdump -d programs/program.o > programs/$(program).dis
	./riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objdump -d programs/program.o | grep -P '^\s+\d+:' | awk '{print $$2}' > programs/memory.out

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

