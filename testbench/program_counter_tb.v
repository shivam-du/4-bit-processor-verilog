`timescale 1ns / 1ps

module program_counter_tb;

reg clk;
reg reset;
reg pc_enable;

wire [3:0] pc;

program_counter DUT(
    .clk(clk),
    .reset(reset),
    .pc_enable(pc_enable),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    pc_enable = 0;

    // Hold reset
    #10;
    reset = 0;

    // Enable counting
    pc_enable = 1;

    // Count for 20 clock cycles
    #200;

    // Freeze PC
    pc_enable = 0;

    #20;

    // Resume counting
    pc_enable = 1;

    #40;

    $finish;

end

endmodule