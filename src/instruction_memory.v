`timescale 1ns / 1ps

module instruction_memory(

    input wire [3:0] address,
    output reg [7:0] instruction

);

always @(*) begin

    case(address)

        4'd0: instruction = 8'b0101_0001; // MOV R0,R1
        4'd1: instruction = 8'b0000_0010; // ADD R0,R2
        4'd2: instruction = 8'b0001_0011; // SUB R0,R3
        4'd3: instruction = 8'b0110_0000; // INC R0
        4'd4: instruction = 8'b1111_0000; // HLT

        default:
            instruction = 8'b0000_0000;   // NOP

    endcase

end

endmodule