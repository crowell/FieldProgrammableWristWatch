`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:50 04/25/2011 
// Design Name: 
// Module Name:    setPulse 
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
module setPulse(uclock,num0,num1,num2,num3,switch,switch2,b0state,pnum0,pnum1,pnum2,pnum3
    );
input [3:0] num0,num1,num2,num3;
input uclock,switch,switch2,b0state;
output reg [3:0] pnum0,pnum1,pnum2,pnum3;
reg [25:0] pulseTime;
reg pulsestate;

initial begin pulsestate = 0; pulseTime = 0; pnum0<=0; pnum1<=0; pnum2<=0; pnum3<=0; end

// Convert Button to a switch
always @(posedge b0state) if (!switch && !switch2) pulsestate =~ pulsestate;

// FSM to set Time while the pulse is high

always @(posedge uclock)
begin

if (pulsestate) 
		begin
				if (pulseTime >= 25_000_000)
				pulseTime <= 0;
				else
				pulseTime <= pulseTime + 1;

				pnum0 <= pulseTime >= (5_500_000) ? num0 : 10 ; // PULSE
				pnum1 <= pulseTime >= (5_500_000) ? num1 : 10 ; // PULSE
				pnum2 <= pulseTime >= (5_500_000) ? num2 : 10 ; // PULSE
				pnum3 <= pulseTime >= (5_500_000) ? num3 : 10 ; // PULSE
		end
				
else if (!pulsestate) // DO NOT PULSE
	begin
		pnum0 <= num0;  
		pnum1 <= num1;  
		pnum2 <= num2;	
		pnum3 <= num3; 
	end
	
				
end

endmodule
