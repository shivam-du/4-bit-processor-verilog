`timescale 1ns / 1ps

module instruction_decoder_tb;

reg [7:0] instruction;

wire [3:0] opcode;
wire [1:0] rd;
wire [1:0] rs;

instruction_decoder DUT(
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs(rs)
);

initial begin

    instruction = 8'h51; #10; // MOV R0,R1
    instruction = 8'h02; #10; // ADD R0,R2
    instruction = 8'h13; #10; // SUB R0,R3
    instruction = 8'h60; #10; // INC R0
    instruction = 8'hF0; #10; // HLT

    $finish;

end

endmodule