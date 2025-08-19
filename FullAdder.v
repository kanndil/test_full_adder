`default_nettype none

//=============================================================================
// Module: FullAdder
// Description: Single-bit full adder with carry propagation
// Author: NativeChips
// Date: 2025-08-19
// License: MIT
//=============================================================================

module FullAdder (
    input  wire a_i,      // First operand
    input  wire b_i,      // Second operand
    input  wire cin_i,    // Carry input
    output wire sum_o,    // Sum output
    output wire cout_o    // Carry output
);

    // Combinational logic for full adder
    // Sum = A XOR B XOR Cin
    // Carry = (A AND B) OR (Cin AND (A XOR B))
    
    wire ab_xor;
    
    assign ab_xor = a_i ^ b_i;
    assign sum_o  = ab_xor ^ cin_i;
    assign cout_o = (a_i & b_i) | (cin_i & ab_xor);

endmodule

`default_nettype wire