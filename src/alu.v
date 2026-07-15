`timescale 1ns / 1ps

module alu(
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [3:0] ALUOp,

    output reg  [3:0] Result,
    output reg        Carry,
    output wire       Zero
);

// ALU Operation Encoding
localparam ADD = 4'b0000;
localparam SUB = 4'b0001;
localparam AND_OP = 4'b0010;
localparam OR_OP  = 4'b0011;
localparam XOR_OP = 4'b0100;
localparam MOV    = 4'b0101;
localparam INC    = 4'b0110;
localparam DEC    = 4'b0111;
localparam NOT_OP = 4'b1000;

always @(*) begin

    // Default assignments prevent inferred latches
    Result = 4'b0000;
    Carry  = 1'b0;

    case(ALUOp)

        ADD: begin
            {Carry, Result} = A + B;
        end

        SUB: begin
            {Carry, Result} = A - B;
        end

        AND_OP: begin
            Result = A & B;
        end

        OR_OP: begin
            Result = A | B;
        end

        XOR_OP: begin
            Result = A ^ B;
        end

        MOV: begin
            Result = B;
        end

        INC: begin
            {Carry, Result} = A + 1'b1;
        end

        DEC: begin
            {Carry, Result} = A - 1'b1;
        end

        NOT_OP: begin
            Result = ~A;
        end

        default: begin
            Result = 4'b0000;
            Carry  = 1'b0;
        end

    endcase

end

assign Zero = (Result == 4'b0000);

endmodule