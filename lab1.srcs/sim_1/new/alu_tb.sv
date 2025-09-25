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
    reg [2:0] control;
    wire signed [OP_WIDTH-1:0] res;

    
    initial begin 
        // NOT(control = 0)
        /* control = 0; op1 = 0; op2 = 0; #10;
        control = 0; op1 = 1; op2 = 0; #10;*/
        control = 3'b000; op1 = 4'b1010; op2 = 4'b0000; #10;
        control = 3'b000; op1 = 4'b1111; op2 = 4'b0000; #10;
        
        // XOR (control = 1)
        /* control = 1; op1 = 0; op2 = 0; #10;
        control = 1; op1 = 0; op2 = 1; #10;
        control = 1; op1 = 1; op2 = 0; #10;
        control = 1; op1 = 1; op2 = 1; #10;*/
        control = 3'b001; op1 = 4'b1010; op2 = 4'b1100; #10;
        control = 3'b001; op1 = 4'b1111; op2 = 4'b0101; #10;
        
        // AND (control = 2)
        control = 3'b010; op1 = 4'b1010; op2 = 4'b1100; #10;
        
        // OR (control = 3)
        control = 3'b011; op1 = 4'b1010; op2 = 4'b1100; #10;
        
        // XNOR (control = 4)
        control = 3'b100; op1 = 4'b1010; op2 = 4'b1100; #10;
        
        // Logical left shift (control = 5) ans: 8
        control = 3'b101; op1 = 4'b1010; op2 = 2; #10;

        // Logical right shift (control = 6) ans: 2
        control = 3'b110; op1 = 4'b1010; op2 = 2; #10;

        // Arithmetic right shift (control = 7) ans: -2
        control = 3'b111; op1 = 4'b1010; op2 = 2; #10;

        // Invalid
        control = 3'b111; op1 = 4'b1010; op2 = 4'b1100; #10;

        $stop();
    end
    alu #(.OP_WIDTH(OP_WIDTH)) dut (.control, .op1, .op2, .res);
endmodule
