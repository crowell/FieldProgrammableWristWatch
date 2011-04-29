`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:50 04/24/2011 
// Design Name: 
// Module Name:    rebouncer 
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
module rebouncerslow(uclock,tob2state,b2state    ); // THIS IS COPY OF THE REGULAR REBOUNCER
// SO ALL THE b2states are just names within this module.

input uclock;
input tob2state;
output reg b2state;

reg [25:0] waitTime;
reg [25:0] pulseTime;
reg state;
reg nextState;

initial begin
waitTime = 0;
state = 0;
nextState =0;
pulseTime =0;
end

always @(posedge uclock) begin state<= nextState; end

always @(posedge uclock) begin if(!tob2state) waitTime<=0; else waitTime<=waitTime+1; end 

always @(posedge uclock)
begin
	if (!tob2state) begin nextState<=0; b2state <= 0; end

	if (state ==0 && tob2state) if (waitTime < 50_000_000 ) begin nextState<=0; b2state<=1; end else nextState <=1; 

	if (state ==1 && tob2state)  // REBOUNCE STATE
		begin
				if (pulseTime >= 10_000_000)
				pulseTime <= 0;
				else
				pulseTime <= pulseTime + 1;

				b2state <= pulseTime >= (5_000_000) ? 1 : 0; // PULSE
		end		
		
end
endmodule
