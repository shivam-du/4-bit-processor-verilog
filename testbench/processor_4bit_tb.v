`timescale 1ns / 1ps

module processor_4bit_tb;

    reg clk;
    reg reset;

    // Instantiate Processor
    processor_4bit DUT (
        .clk(clk),
        .reset(reset)
    );

    // Clock Generation (10 ns period)
    always #5 clk = ~clk;

    initial begin

        // Initialize signals
        clk = 0;
        reset = 1;

        // Keep processor in reset
        #10;
        reset = 0;

        // Preload register values
        // R0 = 5
        // R1 = 2
        // R2 = 3
        // R3 = 1
        DUT.RF.registers[0] = 4'd5;
        DUT.RF.registers[1] = 4'd2;
        DUT.RF.registers[2] = 4'd3;
        DUT.RF.registers[3] = 4'd1;

        // Run processor long enough to execute all instructions
        #100;

        // End simulation
        $finish;

    end

endmodule