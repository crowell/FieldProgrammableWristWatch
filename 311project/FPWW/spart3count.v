`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:48 03/28/2011 
// Design Name: 
// Module Name:    spart3count 
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
module spart3count(LED,uclock,AN, buttons, alarmSwitch,alarmStatus,alarmRing,externalBuzz,buzzer2,cdswitch,cdBuzz,countingDown);
input uclock;
output [6:0] LED;
output [3:0] AN;
input [3:0] buttons;
input alarmSwitch,cdswitch;
output wire alarmStatus, alarmRing,buzzer2,cdBuzz,countingDown;
output externalBuzz;

wire [3:0] a,b,c,d,e,f,num0,num1,num2,num3,a0,a1,a2,a3,cd0,cd1,cd2,cd3,pnum0,pnum1,pnum2,pnum3;
wire [4:0] muxout;
wire [7:0] hh;
wire [6:0] ii;
wire [6:0] LED;
wire switch,switch2;
//wire cdBuzz;

// Clocks
wire [1:0] fastclk;
wire clock;
wire msClock;
wire sclock;

// intermediate Buttons
wire tob2state;
wire tob3state;
wire modeName;

// Buttons
wire b0state;
wire b1state;
wire b2state;
wire b3state;

// Buzzers
wire buzzer;
wire tobuzzer;
wire [1:0] state;

assign externalBuzz = (buzzer || cdBuzz);

////////////// --- USERCLOCKS --- //////////////////////////////////////////////
																										//
fast_clock fast_clk(uclock,fastclk);	// SUPER fast for the leds					//
clock1 clock_1(uclock,clock);				// 1/10 seconds for stopwatch				//
sclock sclock_1(uclock,sclock);			// 1 second clock for rebouncer			//
msclock1 msclock_1(uclock,msClock);		// 1/1000 seconds for alarmBuzz module	//
minuteClk minuteClk(clock,minclk);    	// 1 minute for actual clock				//
////////////////////////////////////////////////////////////////////////////////

/////////////// --- ALARM --- ///////////////////////////////////////////////////////////////////////////////////////////////
																																									//
setAlarm setAlarm(b2state, b3state, uclock, switch, switch2,a0,a1,a2,a3);																	//
alarming alarming(b0state, alarmStatus, alarmRing, tobuzzer, uclock,a0,a1,a2,a3,num0,num1,num2,num3,switch,switch2);			//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////// --- DEBOUNCERS --- ////////////////////////
																			//
debounceIndex debounce0(uclock, buttons[0], b0state);		//
debounceIndex debounce1(uclock, buttons[1], b1state);		//
debounceIndex debounce2(uclock, buttons[2], tob2state);	//
debounceIndex debounce3(uclock, buttons[3], tob3state);	//
///////////////////////////////////////////////////////////

/////////////// --- REBOUNCERS --- //////////////////////////////////////////////////////
																													//
rebouncer rebounce0(uclock,tob2state,b2state);		//Rebouncer for the minutes			//
rebouncerslow rebounce1(uclock,tob3state,b3state); //Rebouncer for the hours				//
/////////////////////////////////////////////////////////////////////////////////////////

/////////////// --- MASTER CLOCK MODULE --- //////////////////////////////////////////////////////////////////////////////
																																								//
clockchange clkchange(uclock,switch2,hh,ii,b2state,b3state,switch,b0state); 							// For Setting 			//
clockCounter clkcnt(minclk,uclock,hh,ii,num0,num1,num2,num3); 												// For Counting			//
setPulse setPulse_01(uclock,num0,num1,num2,num3,switch,switch2,b0state,pnum0,pnum1,pnum2,pnum3);// Pulse the display		//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	


/////////////////////// --- MODE FSM --- //////////////////////////////////////////////////////
																															//
																															//
modeSetter modeSetter_01(uclock,b1state,switch,switch2,modeName);			// MODE CHANGING FSM //
///////////////////////////////////////////////////////////////////////////////////////////////

////////////////////// --- DISPLAY MODULES --- ////////////////////////////////////////////////////////////////////////
																																							//
																																							//
// a,b,c,d : StopWatch Digits 																													//
// pnum0,1,2,3 : Master Clock Digits																											//
// a0,1,2,3 : Alarm Clock Digits																													//
// c0,1,2,3 : Countdown Digits																													//
BCD_MUX1 BCDMUX1(a,b,c,d,pnum0,pnum1,pnum2,pnum3,fastclk,muxout,switch,switch2,modeName,a0,a1,a2,a3,cd0,cd1,cd2,cd3);//
BCD_LED1 BCDLED1(muxout,LED); 																													//
OneTenMux DigitDisp(fastclk,AN);																													//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////// --- STOPWATCH MODULES --- /////////////////////////////////////////////////////////////////////
																																					//
stopstart swstate(tob2state, state, uclock,switch,switch2);	 // Stop Watch FSM											//
counter count(clock,a,b,c,d,state,tob3state,switch,switch2); //b1 state is the "reset" button (for swatch)		//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////// --- BUZZER SOUND --- /////////////////////
alarmBuzz alarmBuzz_1(uclock,msClock,tobuzzer,buzzer);	//
///////////////////////////////////////////////////////////

////////////////// --- COUNTDOWN TIMER --- ///////////////////////////////////////////////////////////////////
countDown countDown_01(uclock,clock,cd0,cd1,cd2,cd3,cdBuzz,tob2state,tob3state,b0state,switch,switch2,countingDown);			//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


endmodule
