`timescale 1ns / 1ps

module control_unit_tb;

reg [3:0] opcode;

wire [3:0] alu_op;
wire reg_write;
wire pc_enable;

control_unit DUT(
    .opcode(opcode),
    .alu_op(alu_op),
    .reg_write(reg_write),
    .pc_enable(pc_enable)
);

initial begin

    // ADD
    opcode = 4'h0; #10;

    // SUB
    opcode = 4'h1; #10;

    // AND
    opcode = 4'h2; #10;

    // OR
    opcode = 4'h3; #10;

    // XOR
    opcode = 4'h4; #10;

    // MOV
    opcode = 4'h5; #10;

    // INC
    opcode = 4'h6; #10;

    // DEC
    opcode = 4'h7; #10;

    // NOT
    opcode = 4'h8; #10;

    // HLT
    opcode = 4'hF; #10;

    $finish;

end

endmodule