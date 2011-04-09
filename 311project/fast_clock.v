`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:28 03/28/2011 
// Design Name: 
// Module Name:    fast_clock 
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
module fast_clock(clk_27Mhz, clk_1hz);
input clk_27Mhz; // user clock
output [1:0] clk_1hz; // divided clock
reg [25:0] count; // counter, is bigger then we need in case you wanna play with it
reg [1:0] clk_1hz; // don't forget the register

initial // This describes what to do as soon as machine turns on
begin
clk_1hz<=0; // resetting everything
count<=0;
end

always @(posedge clk_27Mhz) // whenever a rising edge of 27 MHz happens, do:
begin
// This is just a counter:
if (count >= 50_000)
count <= 0;
else
count <= count + 1;
// counter ends here


// this guy decides if it should be 0 or 1
//clk_1hz <= count >= (25_000) ? 1 : 0;
if (count <= 12_500)
	begin
	clk_1hz = 3;
	end
else if ((count >= 12_500) && (count <= 25_000))
	begin
	clk_1hz = 2;
	end
else if ((count >= 25_000) && (count <= 37_500))
	begin
	clk_1hz = 1;
	end
else
	begin
	clk_1hz = 0;
	end
		
end





endmodule