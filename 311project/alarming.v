`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:09 04/20/2011 
// Design Name: 
// Module Name:    alarming 
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
module alarming(alarmSwitch, alarmStatus, alarmRing, buzzer, uclock,a0,a1,a2,a3,t0,t1,t2,t3);

input alarmSwitch, uclock;
input [3:0] a0,a1,a2,a3,t0,t1,t2,t3;
output reg  alarmStatus, alarmRing,buzzer;

always @ (posedge uclock) begin
alarmStatus=alarmSwitch;
end


always @ (posedge uclock) begin
if (alarmStatus) begin
if (a0==t0 && a1==t1 &&a2==t2 && a3==t3) begin
alarmRing=1;
buzzer=1;
end
else begin
alarmRing=0;
buzzer=0;
end
end
else begin
alarmRing=0;
buzzer=0;
end
end
endmodule
