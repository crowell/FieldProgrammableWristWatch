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
module countDown(uclock,minclock,num0,num1,num2,num3,buzzer,button3,button4,button2,switch,switch2,states);

input minclock, uclock, button3,button4,button2,switch,switch2;

output [3:0] num0; // this would show your ones
output [3:0] num1; // and this one would show your tens
output [3:0] num2;
output [3:0] num3;
output reg buzzer;
output reg states;
reg signed [4:0] num0;
reg signed [4:0] num1;
reg signed [4:0] num2;
reg signed [4:0] num3;

initial
begin
    num0 = 0;
    num1 = 0;
    num2 = 3;
    num3 = 0;
    states=0;
end
always @(posedge button2) begin
if (switch && switch2)
states=~states;
end



always @ (posedge minclock) begin
  
    if (states ==1 ) begin
        if (num0>0 || num1>0 ||num2>0 || num3>0) begin
            num0=num0-1;
            if (num0<0)begin
                num0=9;
                num1=num1-1;
                if (num1<0) begin
                    num1=9;
                    num2=num2-1;
                    if (num2<0) begin
                        num2=5;
                        num3=num3-1;
                        if (num3<0) begin
                    num3=9;
                  end
                    end
              end
        end
    end
    end

if (states==0 && switch && switch2) begin
    if (button3) begin
            num1=num1+1;
            if (num1 >=10) begin
                num1=0;
                num2=num2+1;
                if (num2>=6) begin
                    num2=0;
                    if (num3>=10) begin
                        num3=0;
                    end
                end
            end
        end
    else if(button4) begin
        num3=num3+1;
    if (num3>=10) begin
      num3=0;
    end
      
end
end
end

always @ (posedge uclock) begin
if (states==1 && num0==0 && num1==0 && num2==0 && num3==0) begin
buzzer=1;
end
else begin
buzzer=0;
end
end
endmodule
