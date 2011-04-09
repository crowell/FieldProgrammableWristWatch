`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:59 03/28/2011 
// Design Name: 
// Module Name:    OneTenMux 
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
module OneTenMux(cat1,AN);

input [1:0] cat1;
output reg [3:0] AN;

always @ * begin
 if (cat1==1) 
	 begin
		AN=4'b1101;
	 end
 else if (cat1==0)
	 begin
		AN=4'b1110;
	 end
 else if (cat1==2)
	 begin
		AN=4'b1011;
	 end
 else
	 begin
		AN=4'b0111;
	 end
end
endmodule
