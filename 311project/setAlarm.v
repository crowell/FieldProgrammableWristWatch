`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:32 04/19/2011 
// Design Name: 
// Module Name:    setAlarm 
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
module setAlarm(button3, button4, uclock, switch, switch2, num0,num1,num2,num3);
input button3, button4, uclock, switch, switch2;
output reg [3:0] num0,num1,num2,num3;

reg [6:0] num2and3;
reg pressed;

initial begin
num0=0;
num1=0;
num2=0;
num3=0;
num2and3=0;
end

//assign pressed = button3^button4;

always @ (posedge uclock) begin //set up 24 hour clock nicely	
	if (num2and3 <=9) begin
		num2=num2and3;
		num3=0;
	end
	else if(num2and3 > 9 && num2and3<20) begin
		num3=1;
		num2=num2and3-10;
	end
	else begin
		num3=2;
		num2=num2and3-20;
	end
end

always @(posedge button3) begin
if (switch2 && !switch) begin
		num0=num0+1;
		if (num0 >=10) begin
			num0=0;
			num1=num1+1;
			if (num1>=6) begin
				num1=0;
	/*			num2and3=num2and3+1;
				if (num2and3>=24) begin
					num2and3=0;
					num0=0;
					num1=0;
				end*/
			end
		end
	end
end

always @ (posedge button4) begin
if (switch2 && !switch) begin
	num2and3=num2and3+1;
	if (num2and3>=24) begin
		num2and3=0;
	end
end
end


endmodule
