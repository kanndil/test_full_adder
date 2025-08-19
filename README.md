# Full Adder Implementation

A simple, synthesizable single-bit full adder implementation in Verilog.

## Overview

This project implements a basic full adder circuit that takes three single-bit inputs (A, B, and carry-in) and produces two single-bit outputs (sum and carry-out). The full adder is a fundamental building block in digital arithmetic circuits.

## Truth Table

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 0 | 0 | 0   | 0   | 0    |
| 0 | 0 | 1   | 1   | 0    |
| 0 | 1 | 0   | 1   | 0    |
| 0 | 1 | 1   | 0   | 1    |
| 1 | 0 | 0   | 1   | 0    |
| 1 | 0 | 1   | 0   | 1    |
| 1 | 1 | 0   | 0   | 1    |
| 1 | 1 | 1   | 1   | 1    |

## Logic Equations

- **Sum** = A ⊕ B ⊕ Cin
- **Carry Out** = (A ∧ B) ∨ (Cin ∧ (A ⊕ B))

## Files

- `FullAdder.v` - Main full adder module implementation
- `tb_FullAdder.v` - Comprehensive testbench with all test cases
- `Makefile` - Build automation for linting, simulation, and synthesis
- `FullAdder_synth.v` - Synthesized gate-level netlist (generated)

## Module Interface

```verilog
module FullAdder (
    input  wire a_i,      // First operand
    input  wire b_i,      // Second operand
    input  wire cin_i,    // Carry input
    output wire sum_o,    // Sum output
    output wire cout_o    // Carry output
);
```

## Usage

### Prerequisites

- Icarus Verilog (iverilog) for simulation
- Verilator for linting
- Yosys for synthesis
- Make for build automation

### Quick Start

```bash
# Run all tests and synthesis
make all

# Individual operations
make lint       # Lint the Verilog code
make simulate   # Run testbench simulation
make synthesize # Synthesize to gate-level netlist
make waves      # Generate VCD waveforms
make clean      # Clean generated files
```

### Manual Simulation

```bash
# Compile and run testbench
iverilog -o tb_FullAdder tb_FullAdder.v FullAdder.v
./tb_FullAdder
```

## Test Results

The testbench verifies all 8 possible input combinations and confirms:
- ✅ All functional tests pass
- ✅ Logic equations are correctly implemented
- ✅ Synthesis completes without errors
- ✅ Gate count: 5 gates (2 XOR, 2 AND, 1 OR)

## Synthesis Results

The design synthesizes to:
- **5 logic gates total**
  - 2 XOR gates (for sum calculation)
  - 2 AND gates (for carry generation)
  - 1 OR gate (for carry combination)
- **No latches or flip-flops** (purely combinational)
- **Clean synthesis** with no warnings or errors

## Design Features

- **Synthesizable**: Compatible with open-source EDA tools (Yosys)
- **Lint-clean**: Passes Verilator linting with no warnings
- **Well-documented**: Clear signal naming and comprehensive comments
- **Testable**: Complete testbench with 100% functional coverage
- **Portable**: Standard Verilog-2005 compatible

## Applications

This full adder can be used as a building block for:
- Multi-bit ripple carry adders
- Carry lookahead adders
- Arithmetic logic units (ALUs)
- Digital signal processing circuits
- Any application requiring binary addition

## License

MIT License - See project root for details.

## Author

NativeChips - 2025-08-19