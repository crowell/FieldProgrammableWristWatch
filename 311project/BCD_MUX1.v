`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:18 03/28/2011 
// Design Name: 
// Module Name:    BCD_MUX1 
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
module BCD_MUX1(in1,in2,in3,in4,in5,in6,in7,in8,clk,LED,switch,switch2,a0,a1,a2,a3,cd0,cd1,cd2,cd3);
  output reg [3:0] LED;
  input switch, switch2;
  input [1:0] clk;
  input [3:0] in1,in2,in3,in4,in5,in6,in7,in8;
  input [3:0] a0,a1,a2,a3;
  input [3:0] cd0,cd1,cd2,cd3;
  wire [3:0] in1,in2,in3,in4,in5,in6,in7,in8,a0,a1,a2,a3;
  
always @ * begin

if (switch && !switch2) begin
      if (clk==0)
      LED=in1;
      else if (clk==1)
      LED=in2;
		else if (clk==2)
		LED=in3;
		else
		LED=in4;
		end
else if (!switch && !switch2) begin
      if (clk==0)
      LED=in5;
      else if (clk==1)
      LED=in6;
		else if (clk==2)
		LED=in7;
		else
		LED=in8;
		end
		
else /*if (switch && switch2)*/ begin
      if (clk==0)
      LED=a0;
      else if (clk==1)
      LED=a1;
		else if (clk==2)
		LED=a2;
		else
		LED=a3;
		end
end
  
  

endmodule
