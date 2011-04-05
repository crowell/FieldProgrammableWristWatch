`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:23 03/28/2011 
// Design Name: 
// Module Name:    counter 
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
module counter(clk_1Hz,num0,num1,num2,num3,state,reset,switch);
input clk_1Hz; // 1 Hz clock goes in here
output [3:0] num0; // this would show your ones
output [3:0] num1; // and this one would show your tens
output [3:0] num2;
output [3:0] num3;
input switch;
input [1:0] state; //should we count
input reset; //do we reset?

reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;

// initialize the values (optional)
initial 
begin
	num0 = 0;
	num1 = 0;
	num2 = 0;
	num3 = 0;
end




always @ (posedge clk_1Hz) 
begin

if (!reset&&switch) begin
	num0 = 0;
	num1 = 0;
	num2 = 0;
	num3 = 0;
	end

if(state==1||state==2) begin
	num0 = num0 + 1'b1; // increment the ones bit
	if ( num0 >= 10 ) 
		begin // if it is greater than 9
		num0 = 0; // reset it to 0
		num1 = num1 + 1'b1; // and increment the tens bit.
			if (num1 >= 10) 
				begin // If tens is greater than 9
				num1 = 0; // reset it to 0
				num2 = num2 + 1'b1;
					if (num2 >= 6)
						begin
						num2 = 0;
						num3 = num3 +1'b1;
							if (num3 >= 10)
								begin 
								num3 = 0;
								end
	
						end

				end
		end

end

if((state==0||state==4) && switch) begin
num0=num0;
num1=num1;
num2=num2;
num3=num3;
end
end


/*always @ (posedge clk_1Hz) 
begin
	num0 = num0 + 1'b1; // increment the ones bit
	if ( num0 >= 10 ) 
		begin // if it is greater than 9
		num0 = 0; // reset it to 0
		num1 = num1 + 1'b1; // and increment the tens bit.
			if (num1 >= 10) 
				begin // If tens is greater than 9
				num1 = 0; // reset it to 0
				end
		end
end
*/

endmodule

