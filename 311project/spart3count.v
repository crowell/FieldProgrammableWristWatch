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
module spart3count(LED,uclock,AN, buttons, switch,switch2);
input uclock;
output [6:0] LED;
output [3:0] AN;
input [3:0] buttons;
input switch,switch2;

wire [3:0] muxout,a,b,c,d,e,f,num0,num1,num2,num3;
wire [7:0] hh;
wire [6:0] ii;
wire [6:0] LED;
wire [1:0] fastclk;
wire clock;
wire b0state;
wire b1state;
wire b2state;
wire b3state;
wire [1:0] state;


//////////////Clocks//////////////////
fast_clock fast_clk(uclock,fastclk);// SUPER fast for the leds
clock1 clock_1(uclock,clock);			// 1/10 seconds for stopwatch
minuteClk minuteClk(clock,minclk);    // 1 minute for actual clock
//////////////////////////////////////



//////////////////////////////////debouncers///////////////////////////////////////////////////////////
debounceIndex debounce0(uclock, buttons[0], b0state);
debounceIndex debounce1(uclock, buttons[1], b1state);
debounceIndex debounce2(uclock, buttons[2], b2state);
debounceIndex debounce3(uclock, buttons[3], b3state);
///////////////////////////////////////////////////////////////////////////////////////////////////////


OneTenMux DigitDisp(fastclk,AN);

counter count(clock,a,b,c,d,state,b1state,switch,switch2); //b1 state is the "reset" button (for swatch)


//clkOffset clkOffset(uclock, os1, os2,b2state,b3state,switch2);

////////////////////////Clock//////////////////////////////////////////////
clockchange clkchange(uclock,switch2,hh,ii,b2state,b3state,switch); 
clockCounter clkcnt(minclk,uclock,hh,ii,num0,num1,num2,num3); //for clock



//clockCounter2 clockCounter2(minclk,userclock,num0,num1,num2,num3,b1state,b0state,switch2);



BCD_MUX1 BCDMUX1(a,b,c,d,num0,num1,num2,num3,fastclk,muxout,switch);

BCD_LED1 BCDLED1(muxout,LED);

// FUCK YOU TIME MACHINE timeMachine timeMachine(b3state, userclock, y);




/////////////////FSM////////////////////////
stopstart swstate(b0state, state, uclock);//
////////////////////////////////////////////


//testing//



endmodule
