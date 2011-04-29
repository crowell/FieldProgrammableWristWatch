`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: SAMIR
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
module BCD_MUX1(in1,in2,in3,in4,in5,in6,in7,in8,clk,LED,switch,switch2,modeName,a0,a1,a2,a3,cd0,cd1,cd2,cd3);
  output reg [4:0] LED;
  input switch, switch2, modeName;
  input [1:0] clk;
  input [3:0] in1,in2,in3,in4,in5,in6,in7,in8; // Clock 
  input [3:0] a0,a1,a2,a3;
  input [3:0] cd0,cd1,cd2,cd3;
  wire [3:0] in1,in2,in3,in4,in5,in6,in7,in8,a0,a1,a2,a3,cd0,cd1,cd2,cd3;
  
always @ * begin

if (switch && !switch2 && !modeName) begin // STOPWATCH
      if (clk==0)
      LED=in1;
      else if (clk==1)
      LED=in2;
		else if (clk==2)
		LED=in3;
		else
		LED=in4;
		end
else if (!switch && !switch2 && !modeName) begin // MASTERCLOCK
      if (clk==0)
      LED=in5;
      else if (clk==1)
      LED=in6;
		else if (clk==2)
		LED=in7;
		else
		LED=in8;
		end
		
else if (!switch && switch2 && !modeName) begin // ALARM
      if (clk==0)
      LED=a0;
      else if (clk==1)
      LED=a1;
		else if (clk==2)
		LED=a2;
		else
		LED=a3;
		end
		
else if (switch && switch2 && !modeName) begin // CountDOWN Right now Showing Alarm
      if (clk==0)
      LED=cd0;
      else if (clk==1)
      LED=cd1;
		else if (clk==2)
		LED=cd2;
		else
		LED=cd3;
		end
		
// FAKE TRANSITIONS AS OF 9:11
		
else if (!switch && !switch2 && modeName) begin // DISPLAY Cloc
      if (clk==0)
      LED=20;
      else if (clk==1)
      LED=12;
		else if (clk==2)
		LED=11;
		else
		LED=20;
		end

else if (switch && !switch2 && modeName) begin // DISPLAY Stop
      if (clk==0)
      LED=15;
      else if (clk==1)
      LED=12;
		else if (clk==2)
		LED=14;
		else
		LED=13;
		end
		
else if (!switch && switch2 && modeName) begin // DISPLAY Alar
      if (clk==0)
      LED=17;
      else if (clk==1)
      LED=16;
		else if (clk==2)
		LED=11;
		else
		LED=16;
		end
		
else if (switch && switch2 && modeName) begin // DISPLAY Coun
      if (clk==0)
      LED=19;
      else if (clk==1)
      LED=18;
		else if (clk==2)
		LED=12;
		else
		LED=20;
		end

end
  
endmodule
