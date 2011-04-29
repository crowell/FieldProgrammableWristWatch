`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:14 04/05/2011 
// Design Name: 
// Module Name:    stopstart 
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
module stopstart(
    input b0down,
    output reg [1:0] state,
	 input userclock,
	 input switch,
	 input switch2
    );

	 	 reg [1:0] next_state;
initial begin //we set the initial state to be zero
state=0; //this way, we start with a "paused" stopwatch
next_state=0;
end

always @ (posedge userclock) begin
state<=next_state; //FSM
end

always @ (posedge userclock) begin //same as my diagram

if (state==0 && b0down && switch && !switch2)
next_state<=1;

if (state==0 && !b0down && switch && !switch2)
next_state<=0;

if (state==1 && b0down && switch && !switch2)
next_state<=1;

if (state==1 && !b0down && switch && !switch2)
next_state<=2;

if (state==2 && b0down && switch && !switch2)
next_state<=3;

if (state==2 && !b0down && switch && !switch2)
next_state<=2;

if (state==3 && b0down && switch && !switch2)
next_state<=3;

if (state==3 && !b0down && switch && !switch2)
next_state<=0;

end

endmodule
