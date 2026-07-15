`timescale 1ns / 1ps

module register_file(

    input wire clk,
    input wire reset,
   
    // Write port
    input wire reg_write,
    input wire [1:0] write_addr,
    input wire [3:0] write_data,

    // Read ports
    input wire [1:0] read_addr1,
    input wire [1:0] read_addr2,

    output wire [3:0] read_data1,
    output wire [3:0] read_data2
);

    // Four 4-bit registers
    reg [3:0] registers [0:3];

    integer i;

    // Synchronous write and reset
    always @(posedge clk or posedge reset) begin

        if(reset) begin
            for(i = 0; i < 4; i = i + 1)
                registers[i] <= 4'b0000;
        end

        else if(reg_write) begin
            registers[write_addr] <= write_data;
        end

    end

    // Asynchronous reads
    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];

endmodule