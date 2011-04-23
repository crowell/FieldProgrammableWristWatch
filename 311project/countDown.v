`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:29 04/20/2011 
// Design Name: 
// Module Name:    countDown 
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
module countDown(uclock,minclock,cdswitch,switch2,switch,num0,num1,num2,num3, buzzer,button3,button4
    );

input minclock, uclock, cdswitch, switch2, switch,button3,button4;
output reg [3:0] num0, num1, num2, num3;
output reg buzzer;

initial begin
num0=0;
num1=0;
num2=0;
num3=0;
//num2and3=0;
end

//
//always @(posedge button3) begin
//if (!cdswitch) begin
//num0 = num0 + 1'b1; // increment the ones bit
//	if ( num0 >= 10 ) 
//		begin // if it is greater than 9
//		num0 = 0; // reset it to 0
//		num1 = num1 + 1'b1; // and increment the tens bit.
//			if (num1 >= 6) 
//				begin // If tens is greater than 9
//				num1 = 0; // reset it to 0
//				num2 = num2 + 1'b1;
//					if (num2 >= 10)
//						begin
//						num2 = 0;
//						num3 = num3 +1'b1;
//							if (num3 >= 6)
//								begin 
//								num3 = 0;
//								end
//	
//						end
//
//				end
//		end
//end
//
//end


// Code for counting downwards
always @ (posedge uclock) begin
if (cdswitch) begin
if (num0==0 && num1==0 && num2==0 && num3==0) begin
buzzer=1;
end
else
buzzer=0;
end
end

// Counting Downwards
always @ (posedge minclock) begin
if (cdswitch) begin
	num0 = num0 - 1'b1; // increment the ones bit
	if ( num0 >= 10 ) 
		begin // if it is greater than 9
		num0 = 9; // reset it to 9
		num1 = num1 - 1'b1; // and increment the tens bit.
			if (num1 >= 6) 
				begin // If tens is greater than 6
				num1 = 5; // reset it to 0
				num2 = num2 - 1'b1;
					if (num2 >= 9)
						begin
						num2 = 9;
						num3 = num3 -1'b1;
							if (num3 >= 6)
								begin 
								num3 = 5;
								end
	
						end

				end
		end

end
else begin
	if (button3)begin
	num0 = num0 + 1'b1; // increment the ones bit
		if ( num0 >= 10 ) 
			begin // if it is greater than 9
			num0 = 0; // reset it to 0
			num1 = num1 + 1'b1; // and increment the tens bit.
				if (num1 >= 6) 
					begin // If tens is greater than 9
					num1 = 0; // reset it to 0
					num2 = num2 + 1'b1;
						if (num2 >= 10)
							begin
							num2 = 0;
							num3 = num3 +1'b1;
								if (num3 >= 6)
									begin 
									num3 = 0;
									end
							end
					end
			end
	end
	end
end

endmodule
