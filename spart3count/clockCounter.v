`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:45:04 04/05/2011 
// Design Name: 
// Module Name:    clockCounter 
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
module clockCounter(clk_1Hz,num0,num1,num2,num3,button2,button3,switch);
input clk_1Hz; // 1 Hz clock goes in here
input button2,button3;
input switch;
output [3:0] num0; // this would show your ones
output [3:0] num1; // and this one would show your tens
output [3:0] num2;
output [3:0] num3;


reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;

reg [6:0] n2and3;


// initialize the values (optional)
initial 
begin
	num0 = 0;
	num1 = 0;
	num2 = 0;
	num3 = 0;
	n2and3=0;
end

always @(posedge clk_1Hz)
begin



if (n2and3 <=9) begin
num2=n2and3;
num3=0;
end
else if (n2and3 > 9 && n2and3<20) begin
num3=1;
num2=n2and3-10;
end
else begin
num3=2;
num2=n2and3-20;
end
end





always @ (posedge clk_1Hz) 
begin


	num0 = num0 + 1'b1; // increment the ones bit
	if ( num0 >= 10 ) 
		begin // if it is greater than 9
		num0 = 0; // reset it to 0
		num1 = num1 + 1'b1; // and increment the tens bit.
			if (num1 >= 6) 
				begin // If tens is greater than 9
				num1 = 0; // reset it to 0
				n2and3 = n2and3 + 1'b1;
					if (n2and3 >= 24)
						begin
						n2and3=1;
						num0=0;
						num1=0;
						end

				end
		end
end




endmodule



