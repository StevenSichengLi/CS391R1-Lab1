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


module alu #(parameter OP_WIDTH = 1)(
    input  wire [OP_WIDTH-1:0] op1,
    input  wire [OP_WIDTH-1:0] op2,
    input  wire [2:0] control,
    output reg [OP_WIDTH-1:0] res
    );
    // assign res = (control == 1'b0) ? ~op1 : (op1 ^ op2);
    
    always_comb begin
      if (control == 3'b000)      res = ~op1;
      else if (control == 3'b001) res = op1 ^ op2;
      else if (control == 3'b010) res = op1 & op2;
      else if (control == 3'b011) res = op1 | op2;
      else if (control == 3'b100) res = ~(op1 ^ op2);
      else                        res = '0;
    end
    
endmodule
