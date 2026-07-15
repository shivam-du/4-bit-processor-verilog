`timescale 1ns / 1ps

module instruction_memory_tb;

reg [3:0] address;

wire [7:0] instruction;

instruction_memory DUT(
    .address(address),
    .instruction(instruction)
);

initial begin

    address = 4'd0; #10;
    address = 4'd1; #10;
    address = 4'd2; #10;
    address = 4'd3; #10;
    address = 4'd4; #10;
    address = 4'd5; #10;
    address = 4'd6; #10;

    $finish;

end

endmodule