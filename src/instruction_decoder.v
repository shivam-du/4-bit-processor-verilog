`timescale 1ns / 1ps

module instruction_decoder(

    input  wire [7:0] instruction,

    output wire [3:0] opcode,
    output wire [1:0] rd,
    output wire [1:0] rs

);

assign opcode = instruction[7:4];
assign rd     = instruction[3:2];
assign rs     = instruction[1:0];

endmodule