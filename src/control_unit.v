`timescale 1ns / 1ps

module control_unit(

    input wire [3:0] opcode,

    output reg [3:0] alu_op,
    output reg reg_write,
    output reg pc_enable

);

always @(*) begin

    // Defaults
    alu_op    = 4'b0000;
    reg_write = 1'b0;
    pc_enable = 1'b1;

    case(opcode)

        4'h0: begin alu_op = 4'h0; reg_write = 1; end // ADD
        4'h1: begin alu_op = 4'h1; reg_write = 1; end // SUB
        4'h2: begin alu_op = 4'h2; reg_write = 1; end // AND
        4'h3: begin alu_op = 4'h3; reg_write = 1; end // OR
        4'h4: begin alu_op = 4'h4; reg_write = 1; end // XOR
        4'h5: begin alu_op = 4'h5; reg_write = 1; end // MOV
        4'h6: begin alu_op = 4'h6; reg_write = 1; end // INC
        4'h7: begin alu_op = 4'h7; reg_write = 1; end // DEC
        4'h8: begin alu_op = 4'h8; reg_write = 1; end // NOT

        4'hF: begin
            reg_write = 0;
            pc_enable = 0;
        end

    endcase

end

endmodule