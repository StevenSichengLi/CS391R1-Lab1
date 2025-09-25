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
    reg op1, control, op2;
    wire res;
    
    initial begin 
        // NOT(control = 0)
        control = 0; op1 = 0; op2 = 0; #10;
        control = 0; op1 = 1; op2 = 0; #10;
        // XOR (control = 1)
        control = 1; op1 = 0; op2 = 0; #10;
        control = 1; op1 = 0; op2 = 1; #10;
        control = 1; op1 = 1; op2 = 0; #10;
        control = 1; op1 = 1; op2 = 1; #10;
        
        $stop();
    end
    alu dut (.control, .op1, .op2, .res);
endmodule
