# Initialization
```
make init
```
This installs required tools to run the core

## A Single Cycle RISC-V core supporting RV32I Instruction Set

```
make core TEST_PROGRAM=<your_test_name>
```
Executes the program test.S by default. Custom tests must be put under program directory.

```
make compile TB=<test_bench_name> DESIGN=<module_name>
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

Tools Directory (tools/):
	Contains the .sh script to install the tools and tools required to run the simulation.
