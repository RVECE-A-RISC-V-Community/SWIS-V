## Initialization
```
make init
```
This installs iverilog and gtkwave required to run the simulations

## A Single Cycle RISC-V core supporting RV32I Instruction Set

```
make core
```
This target cleans log files, aligns memory to Little Endian using a Python script, compiles Verilog files specified in rtl/top_module.v and test_bench/tb_top_module.v, generates a waveform, and opens it using gtkwave.

```
make compile
```
Use this target if you only want to compile a Verilog file with a test-bench.

To clean up generated files:
```
make clean
```
This removes .vvp files, log files, and waveform outputs.

## File Structure

RTL Directory (rtl/):
	Contains the main Verilog design files.

Test Bench Directory (test_bench/):
	Includes the test bench for all the verilog files.

Programs Directory (programs/):
	Contains the Python script (align.py) for aligning the instruction code to Little Endian and the assembly programs to test the core and their instruction code files.


