`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:32 04/06/2011 
// Design Name: 
// Module Name:    timeMachine 
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
module timeMachine(button4, userclock, yy);
input button4;
input userclock;
output reg yy;
reg [1:0] state, next_state;
reg prevbuttonpress;

always@(posedge button4) begin
yy<=1;
yy<=0;
end



endmodule
