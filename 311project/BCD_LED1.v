`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:33 03/28/2011 
// Design Name: 
// Module Name:    BCD_LED1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BCD_LED1(in,LED);
  output[6:0] LED;
  reg[6:0] LED;
  input [3:0] in;
  always @(in)
   case (in)
          0: LED = 7'b0000001;
            1: LED = 7'b1001111;
            2: LED = 7'b0010010;
            3: LED = 7'b0000110;
            4: LED = 7'b1001100;
            5: LED = 7'b0100100;
            6: LED = 7'b1100000;
            7: LED = 7'b0001111;
            8: LED = 7'b0000000;
            9: LED = 7'b0001100;
     default: LED = 7'b1111111;
   endcase

endmodule
