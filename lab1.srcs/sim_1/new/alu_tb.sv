`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 12:52:29 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu_tb();
    parameter OP_WIDTH = 4;
    
    reg signed [OP_WIDTH-1:0] op1, op2;
    reg [3:0] control;
    wire signed [OP_WIDTH-1:0] res;

    
    initial begin
    // NOT (control = 0000)
    control=4'b0000; op1=4'b1010; op2=4'b0000; #10;
    control=4'b0000; op1=4'b1111; op2=4'b0000; #10;

    // XOR (control = 0001)
    control=4'b0001; op1=4'b1010; op2=4'b1100; #10;
    control=4'b0001; op1=4'b1111; op2=4'b0101; #10;

    // AND (control = 0010)
    control=4'b0010; op1=4'b1010; op2=4'b1100; #10;

    // OR (control = 0011)
    control=4'b0011; op1=4'b1010; op2=4'b1100; #10;

    // XNOR (control = 0100)
    control=4'b0100; op1=4'b1010; op2=4'b1100; #10;

    // Logical left shift (control = 0101) expect 8
    control=4'b0101; op1=4'b1010; op2=2; #10;

    // Logical right shift (control = 0110) expect 2
    control=4'b0110; op1=4'b1010; op2=2; #10;

    // Arithmetic right shift (control = 0111) expect -2
    control=4'b0111; op1=4'b1010; op2=2; #10;

    // ADD (control = 1000)
    control=4'b1000; op1=4'd5; op2=4'd3; #10;   // expect 8
    control=4'b1000; op1=-3; op2=2;    #10;   // expect -1

    // SUB (control = 1001)
    control=4'b1001; op1=4'd7; op2=4'd2; #10;   // expect 5
    control=4'b1001; op1=4'd2; op2=4'd7; #10;   // expect -5

    // Invalid (control > 1001)
    control=4'b1111; op1=4'b1010; op2=4'b1100; #10;

    $stop;
end
    alu #(.OP_WIDTH(OP_WIDTH)) dut (.control, .op1, .op2, .res);
endmodule
