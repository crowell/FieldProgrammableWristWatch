`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:49 04/24/2011 
// Design Name: 
// Module Name:    alarmBuzz 
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
module alarmBuzz(uclock,msClock,tobuzzer,buzzer
    );
	 
input msClock;
input uclock;
input tobuzzer;
output reg buzzer;

reg [9:0] waitTime; 
reg [3:0] state;
reg [3:0] nextState;

// Begin with all Registers at 0
initial begin waitTime=0; state = 0; nextState = 0; end


// Assign state to next state at posedge of userclock
always @ (posedge uclock) begin
state<=nextState; //FSM
end

// Controlling the waitTime Counter
always @ (posedge msClock) begin

if (waitTime>=1020) waitTime<=0; 		// Reset at the Limit
if (tobuzzer) waitTime<=waitTime+1; 	// WaitTime Counter
else waitTime<=0; 							// Keep at Zero
end

// State machine to determine the nextstate
always @(msClock) 
begin

	if (state == 0 && tobuzzer) begin nextState<=1; buzzer<=0; end
	
	if (state == 1 && tobuzzer) if (waitTime<80 || waitTime>=1020 ) begin nextState<=1; buzzer<=1; end   else nextState<=2; // Buzz 1
	
	if (state == 2 && tobuzzer) if (waitTime<140 ) begin nextState<=2; buzzer<=0; end  else nextState<=3;
	
	if (state == 3 && tobuzzer) if (waitTime<220 ) begin nextState<=3; buzzer<=1; end  else nextState<=4; // Buzz 2

	if (state == 4 && tobuzzer) if (waitTime<280 ) begin nextState<=4; buzzer<=0; end  else nextState<=5;
	
	if (state == 5 && tobuzzer) if (waitTime<360 ) begin nextState<=5; buzzer<=1; end  else nextState<=6; // Buzz 3

	if (state == 6 && tobuzzer) if (waitTime<420 ) begin nextState<=6; buzzer<=0; end  else nextState<=7;

	if (state == 7 && tobuzzer) if (waitTime<500 ) begin nextState<=7; buzzer<=1; end  else nextState<=8; // Buzz 4

	if (state == 8 && tobuzzer) if (waitTime<1020) begin nextState<=8; buzzer<=0; end  else nextState<=1; // Long Wait

	if (!tobuzzer) begin buzzer<=0; nextState<=0; end // If tobuzzer is off do not buzz
end
endmodule
