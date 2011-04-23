`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:35 04/05/2011 
// Design Name: 
// Module Name:    clockchange 
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
module clockchange(userclock,switch2,n0and1,n2and3,button2,button3,switch);
input userclock; // 1 Hz clock goes in here
input switch,switch2;
input button2,button3;

output [6:0] n2and3;
output [7:0] n0and1;


reg [7:0] n0and1;
reg [6:0] n2and3;
reg signal;

initial begin
	n0and1=0;
	n2and3=0;
end

always @ (posedge userclock)
signal = button2 ^ button3;

always @ (posedge signal)
	begin
		if(button2 && (!switch2 && !switch))
			begin
			n0and1 = n0and1+1'b1;
				if ( n0and1 >= 60 ) 
					begin // if it is greater than 9
						n0and1=0;	
					end
			end

			
		else if (button3 && (!switch2 && !switch))
			begin
			n2and3 = n2and3+1'b1;
			if (n2and3 >= 24)
					begin
					n2and3=0;
					end
			end

	end









endmodule
