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
module clockCounter(clk_1Hz,userclock,h,i,num0,num1,num2,num3);
input clk_1Hz,userclock; // 1 Hz clock goes in here


input [7:0] h;
input [6:0] i;
output reg [3:0] num0; // this would show your ones
output reg [3:0] num1; // and this one would show your tens
output reg [3:0] num2;
output reg [3:0] num3;

//reg [3:0] temp0,temp1;

reg [7:0] n0and1;
reg [6:0] n2and3;




always @(posedge userclock)
begin	
///////////////////New stuff added////////////////////////
		if ((n0and1+h) <=9)
			begin
				num0=(n0and1+h);
				num1=0;
			end
		else if ((n0and1+h) > 9 && (n0and1+h)<20)
			begin
				num0=(n0and1+h)-10;
				num1=1;
			end
		else if ((n0and1+h) > 19 && (n0and1+h)<30)
			begin
				num0=(n0and1+h)-20;
				num1=2;
			end
		else if ((n0and1+h) >29 && (n0and1+h)<40)
			begin
				num0=(n0and1+h)-30;
				num1=3;
			end
		else if ((n0and1+h) >39 && (n0and1+h)<50)
			begin
				num0=(n0and1+h)-40;
				num1=4;
			end
		else if ((n0and1+h) >49 && (n0and1+h)<60)
			begin
				num0=(n0and1+h)-50;
				num1=5;
			end
		else if ((n0and1+h) >59 && (n0and1+h)<70)
			begin
				num0=(n0and1+h)-60;
				num1=0;
			end
		else if ((n0and1+h) >69 && (n0and1+h)<80)
			begin
				num0=(n0and1+h)-70;
				num1=0;
			end
		else if ((n0and1+h) >79 && (n0and1+h)<90)
			begin
				num0=(n0and1+h)-80;
				num1=0;
			end
		else if ((n0and1+h) >89 && (n0and1+h)<100)
			begin
				num0=(n0and1+h)-90;
				num1=0;
			end
		else if ((n0and1+h) >99 && (n0and1+h)<110)
			begin
				num0=(n0and1+h)-100;
				num1=0;
			end
		else if ((n0and1+h) >109 && (n0and1+h)<120)
			begin
				num0=(n0and1+h)-110;
				num1=0;
			end


end

always @(posedge userclock)
begin
		if ((n2and3+i) <=9) 
			begin
				num2=(n2and3+i);
				num3=0;
			end
		else if ((n2and3+i) > 9 && (n2and3+i)<20) 
			begin
			num2=(n2and3+i)-10;
			num3=1;
			end
		else if ((n2and3+i) > 19 && (n2and3+i)<24) 
			begin
			num2=(n2and3+i)-20;
			num3=2;
			end
			
		else if ((n2and3+i) > 23 && (n2and3+i)<34) 
			begin
			num2=(n2and3+i)-24;
			num3=0;
			end
			
		else if ((n2and3+i) > 33 && (n2and3+i)<44) 
			begin
			num2=(n2and3+i)-34;
			num3=1;
			end
			
		else if ((n2and3+i) > 43 && (n2and3+i)<48) 
			begin
			num2=(n2and3+i)-38;
			num3=1;
			end
			
end








always @ (posedge clk_1Hz) 
begin
	n0and1 = n0and1 + 1'b1; // increment the ones bit


	if ( n0and1 > 59 ) 
		begin // if it is greater than 9
		n0and1 = 0; // reset it to 0

		end
	else if ((n0and1+h)==60)
		begin
			n2and3 = n2and3+1'b1;
			if (n2and3 > 23)
				begin
				n2and3=0;

				end
		end
end



/*
Old Code from above, might need again? - Richard

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
*/




endmodule



