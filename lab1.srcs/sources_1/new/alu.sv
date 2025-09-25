`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 12:40:59 PM
// Design Name: 
// Module Name: alu
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


module alu #(parameter OP_WIDTH = 4)(
    input  wire signed [OP_WIDTH-1:0] op1,
    input  wire signed [OP_WIDTH-1:0] op2,
    input  wire [3:0] control,
    output reg  signed [OP_WIDTH-1:0] res
);

    always_comb begin
        if      (control == 4'b0000) res = ~op1;
        else if (control == 4'b0001) res = op1 ^ op2;
        else if (control == 4'b0010) res = op1 & op2;
        else if (control == 4'b0011) res = op1 | op2;
        else if (control == 4'b0100) res = ~(op1 ^ op2);
        else if (control == 4'b0101) res = op1 << op2;
        else if (control == 4'b0110) res = op1 >> op2;
        else if (control == 4'b0111) res = op1 >>> op2;
        else if (control == 4'b1000) res = op1 + op2;
        else if (control == 4'b1001) res = op1 - op2;
        else                         res = {OP_WIDTH{1'b0}};
    end
endmodule