`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:32 04/05/2011 
// Design Name: 
// Module Name:    clkOffset 
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
module clkOffset(userclock, os1, os2,button2,button3,switch2
    );
input userclock;
input button2;
input button3;
input switch2;
output reg [10:0] os1,os2;
initial begin 
os1=0;
os2=0;
end
always @(posedge userclock)
begin
if (switch2 && button2)begin
os1=os1+1;
end
else if(switch2 && button3) begin
os2=os2+1;
end
end



endmodule
