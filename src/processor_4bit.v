`timescale 1ns / 1ps

module processor_4bit(

    input clk,
    input reset

);

// Internal Wires

// Program Counter
wire [3:0] pc;
wire pc_enable;

// Instruction Fetch
wire [7:0] instruction;

// Decoded Fields
wire [3:0] opcode;
wire [1:0] rd;
wire [1:0] rs;

// Control Signals
wire [3:0] alu_op;
wire reg_write;

// Register File Signals
wire [3:0] read_data1;
wire [3:0] read_data2;

// ALU Signals
wire [3:0] alu_result;
wire carry;
wire zero;

// Program Counter
program_counter PC (

    .clk(clk),
    .reset(reset),
    .pc_enable(pc_enable),
    .pc(pc)

);

// Instruction Memory
instruction_memory IM (

    .address(pc),
    .instruction(instruction)

);

// Instruction Decoder
instruction_decoder ID (

    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs(rs)

);

// Control Unit
control_unit CU (

    .opcode(opcode),
    .alu_op(alu_op),
    .reg_write(reg_write),
    .pc_enable(pc_enable)

);

// Register File
register_file RF (

    .clk(clk),
    .reset(reset),

    .reg_write(reg_write),

    // Write Back
    .write_addr(rd),
    .write_data(alu_result),

    // Operand Reads
    .read_addr1(rd),
    .read_addr2(rs),

    .read_data1(read_data1),
    .read_data2(read_data2)

);

// ALU
alu ALU (

    .A(read_data1),
    .B(read_data2),
    .ALUOp(alu_op),

    .Result(alu_result),
    .Carry(carry),
    .Zero(zero)

);

endmodule