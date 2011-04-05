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
module spart3count(LED,uclock,AN, buttons, switch);
input uclock;
output [6:0] LED;
output [3:0] AN;
input [3:0] buttons;
input switch;

wire [3:0] muxout,a,b,c,d,e,f,g,h;
wire [6:0] LED;
wire [1:0] fastclk;
wire clock;
wire b0state, b0up, b0down;
wire b1state, b1up, b1down;
wire [1:0] state;
//////////////Clocks//////////////////
fast_clock fast_clk(uclock,fastclk);// SUPER fast for the leds
clock1 clock_1(uclock,clock);			// 1/10 seconds for stopwatch
minuteClk minuteClk(uclock,minclk);    // 1 minute for actual clock
//////////////////////////////////////


OneTenMux DigitDisp(fastclk,AN);

counter count(clock,a,b,c,d,state,b1state,switch); //b1 state is the "reset" button (for swatch)
clockCounter clkcnt(minclk, e,f,g,h,b2state,b3state,switch); //for clock


BCD_MUX1 BCDMUX1(a,b,c,d,e,f,g,h,fastclk,muxout,switch);

BCD_LED1 BCDLED1(muxout,LED);


//////////////////////////////////debouncers///////////////////////////////////////////////////////////
PushButton_Debouncer debounce0(uclock, buttons[0], b0state, b0up, b0down);
PushButton_Debouncer debounce1(uclock, buttons[1], b1state, b1up, b1down);
PushButton_Debouncer debounce2(uclock, buttons[2], b2state, b2up, b2down);
PushButton_Debouncer debounce3(uclock, buttons[3], b3state, b3up, b3down);
///////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////FSM////////////////////////
stopstart swstate(b0state, state, uclock);//
////////////////////////////////////////////





endmodule
