# Makefile for FullAdder project
# Author: NativeChips
# Date: 2025-08-19

# Project settings
TOP_MODULE = FullAdder
TESTBENCH = tb_FullAdder
VERILOG_FILES = $(TOP_MODULE).v
TESTBENCH_FILES = $(TESTBENCH).v $(VERILOG_FILES)

# Tools
IVERILOG = iverilog
VVP = vvp
VERILATOR = verilator
YOSYS = yosys

# Default target
all: lint simulate synthesize

# Lint the Verilog code
lint:
	@echo "=== Linting Verilog code ==="
	$(VERILATOR) --lint-only $(VERILOG_FILES)
	@echo "✅ Linting completed successfully"

# Simulate the design
simulate: $(TESTBENCH)
	@echo "=== Running simulation ==="
	./$(TESTBENCH)

# Compile testbench
$(TESTBENCH): $(TESTBENCH_FILES)
	@echo "=== Compiling testbench ==="
	$(IVERILOG) -o $(TESTBENCH) $(TESTBENCH_FILES)

# Synthesize with Yosys
synthesize:
	@echo "=== Synthesizing with Yosys ==="
	@echo "read_verilog $(VERILOG_FILES)" > synth.ys
	@echo "hierarchy -top $(TOP_MODULE)" >> synth.ys
	@echo "proc; opt; fsm; opt; memory; opt" >> synth.ys
	@echo "techmap; opt" >> synth.ys
	@echo "stat" >> synth.ys
	@echo "write_verilog $(TOP_MODULE)_synth.v" >> synth.ys
	$(YOSYS) -s synth.ys
	@echo "✅ Synthesis completed - output: $(TOP_MODULE)_synth.v"

# Generate waveforms (VCD)
waves: $(TESTBENCH)
	@echo "=== Generating waveforms ==="
	$(VVP) $(TESTBENCH) -vcd
	@echo "✅ Waveforms generated: dump.vcd"

# Clean generated files
clean:
	rm -f $(TESTBENCH) *.vcd *.ys *_synth.v

# Show help
help:
	@echo "Available targets:"
	@echo "  all        - Run lint, simulate, and synthesize"
	@echo "  lint       - Lint Verilog code with Verilator"
	@echo "  simulate   - Run testbench simulation"
	@echo "  synthesize - Synthesize design with Yosys"
	@echo "  waves      - Generate VCD waveforms"
	@echo "  clean      - Remove generated files"
	@echo "  help       - Show this help message"

.PHONY: all lint simulate synthesize waves clean help