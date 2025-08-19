`default_nettype none

//=============================================================================
// Testbench: tb_FullAdder
// Description: Testbench for single-bit full adder
// Author: NativeChips
// Date: 2025-08-19
//=============================================================================

module tb_FullAdder;

    // Test signals
    reg  a_tb;
    reg  b_tb;
    reg  cin_tb;
    wire sum_tb;
    wire cout_tb;
    
    // Expected results
    reg expected_sum;
    reg expected_cout;
    
    // Test counter
    integer test_count;
    integer pass_count;

    // Instantiate the Unit Under Test (UUT)
    FullAdder uut (
        .a_i(a_tb),
        .b_i(b_tb),
        .cin_i(cin_tb),
        .sum_o(sum_tb),
        .cout_o(cout_tb)
    );

    // Test procedure
    initial begin
        $display("Starting Full Adder Test");
        $display("Time\tA\tB\tCin\tSum\tCout\tExpected_Sum\tExpected_Cout\tResult");
        $display("----\t-\t-\t---\t---\t----\t------------\t-------------\t------");
        
        test_count = 0;
        pass_count = 0;
        
        // Test all possible input combinations (2^3 = 8 cases)
        for (integer i = 0; i < 8; i = i + 1) begin
            // Extract bits for test inputs
            a_tb = i[0];
            b_tb = i[1];
            cin_tb = i[2];
            
            // Calculate expected results
            expected_sum = a_tb ^ b_tb ^ cin_tb;
            expected_cout = (a_tb & b_tb) | (cin_tb & (a_tb ^ b_tb));
            
            // Wait for combinational logic to settle
            #10;
            
            // Check results
            test_count = test_count + 1;
            if (sum_tb == expected_sum && cout_tb == expected_cout) begin
                $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t\t%b\t\tPASS", 
                         $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb, expected_sum, expected_cout);
                pass_count = pass_count + 1;
            end else begin
                $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t\t%b\t\tFAIL", 
                         $time, a_tb, b_tb, cin_tb, sum_tb, cout_tb, expected_sum, expected_cout);
            end
        end
        
        // Test summary
        $display("\n=== Test Summary ===");
        $display("Total Tests: %0d", test_count);
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", test_count - pass_count);
        
        if (pass_count == test_count) begin
            $display("✅ ALL TESTS PASSED!");
        end else begin
            $display("❌ SOME TESTS FAILED!");
        end
        
        $finish;
    end

endmodule

`default_nettype wire