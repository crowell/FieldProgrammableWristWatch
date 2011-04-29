`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: BU
// Engineer: RichTia / Samir
// 
// Create Date:    20:40:26 04/25/2011 
// Design Name: 
// Module Name:    modeSetter 
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
module modeSetter(uclock,b1state,switch,switch2,modeName
    );
input b1state,uclock;
output reg switch, switch2, modeName;

reg [7:0] state;
reg [7:0] nextState;

// Initialize!;
initial begin state = 0; nextState = 0; end

// Assign state to next state at posedge of userclock
always @ (posedge uclock) begin state<=nextState; end 

always @ (posedge uclock)
begin

//MASTER CLOCK
	
	if (state == 0 ) // Clock Display Mode
	if (b1state) begin nextState<=1; modeName <= 1; switch<=0; switch2<=0; end // Transition
	else begin nextState<=0; switch<=0; switch2<=0; modeName<=0; end // Stay

//NEXT DISP: STOP

		if (state == 1) // Displaying "StOP" letters
		if (b1state) begin nextState<=1; modeName <= 1; switch<=1; switch2<=0; end // Stay
		else begin nextState<=2; switch<=1; switch2<=0; modeName<=0; end // Transition

//STOPWATCH
	
	if (state == 2 ) // Stopwatch Display Mode
	if (b1state) begin nextState<=3; modeName <= 1; switch<=1; switch2<=0; end // Transition
	else begin nextState<=2; switch<=1; switch2<=0; modeName<=0; end // Stay
	
//NEXT DISP : ALAR

		if (state == 3) // Displaying "ALAR" letters
		if (b1state) begin nextState<=3; modeName <= 1; switch<=0; switch2<=1; end // Stay
		else begin nextState<=4; switch<=0; switch2<=1; modeName<=0; end // Transition

//ALARM

	if (state == 4 ) // Alarm Display Mode
	if (b1state) begin nextState<=5; modeName <= 1; switch<=0; switch2<=1; end // Transition
	else begin nextState<=4; switch<=0; switch2<=1; modeName<=0; end // Stay

//NEXT DISP : COUN

		if (state == 5) // Displaying "COUN" letters
		if (b1state) begin nextState<=5; modeName <= 1; switch<=1; switch2<=1; end // Stay
		else begin nextState<=6; switch<=1; switch2<=1; modeName<=0; end // Transition

//COUNTDOWN TIMER

	if (state == 6 ) // Alarm Display Mode
	if (b1state) begin nextState<=7; modeName <= 1; switch<=0; switch2<=1; end // Transition
	else begin nextState<=6; switch<=1; switch2<=1; modeName<=0; end // Stay


//NEXT DISP: Cloc

		if (state == 7) // Displaying "Cloc" letters
		if (b1state) begin nextState<=7; modeName <= 1; switch<=0; switch2<=0; end // Stay
		else begin nextState<=0; switch<=0; switch2<=0; modeName<=0; end // Transition

end

endmodule
