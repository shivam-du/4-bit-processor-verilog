`timescale 1ns / 1ps

module register_file_tb;

reg clk;
reg reset;

reg reg_write;
reg [1:0] write_addr;
reg [3:0] write_data;

reg [1:0] read_addr1;
reg [1:0] read_addr2;

wire [3:0] read_data1;
wire [3:0] read_data2;

register_file DUT(

    .clk(clk),
    .reset(reset),

    .reg_write(reg_write),
    .write_addr(write_addr),
    .write_data(write_data),

    .read_addr1(read_addr1),
    .read_addr2(read_addr2),

    .read_data1(read_data1),
    .read_data2(read_data2)

);


// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    reg_write = 0;

    #10;
    reset = 0;

    // Write values into registers
    reg_write = 1;

    write_addr = 2'b00;
    write_data = 4'd5;
    #10;

    write_addr = 2'b01;
    write_data = 4'd9;
    #10;

    write_addr = 2'b10;
    write_data = 4'd12;
    #10;

    write_addr = 2'b11;
    write_data = 4'd15;
    #10;

    reg_write = 0;

    // Read values
    
    read_addr1 = 2'b00;
    read_addr2 = 2'b00;

    read_addr1 = 2'b00;
    read_addr2 = 2'b01;
    #10;

    read_addr1 = 2'b10;
    read_addr2 = 2'b11;
    #10;

    $finish;

end

endmodule