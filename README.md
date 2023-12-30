There are several targets available:
make core

This target cleans log files, aligns memory to Little Endian using a Python script, compiles Verilog files specified in rtl/top_module.v and test_bench/tb_top_module.v, generates a waveform, and opens it using gtkwave.
```
make compile
```

Use this target if you only want to compile Verilog files without aligning memory and generating waveform.
Cleaning

To clean up generated files:
```
make clean
```

This removes .vvp files, log files, and waveform outputs.
File Structure

    RTL Directory (rtl/):
        Contains the main Verilog design file: top_module.v.

    Test Bench Directory (test_bench/):
        Includes the test bench for top_module.v: tb_top_module.v.

    Programs Directory (programs/):
        Contains the Python script (align.py) for aligning memory to Little Endian and potentially other memory-related operations.

Running the Makefile

Ensure you have the necessary permissions to install packages (sudo) and execute Makefile targets. Modify the variables (RTL_DIR, VERILOG_FILE, TEST_BENCH, MEM_FILE, PYTHON_SCRIPT, WAVEFORM_VIEWER) according to your directory structure and file names.
Example Commands:

To compile and simulate Verilog:
```
make core
```

To clean generated files:
```
make clean
```

