`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 11:34:11
// Design Name: 
// Module Name: sim_keyboard
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_keyboard(

    );
    reg Reset;
    reg [1:0]Address;
    reg Cs;
    reg Clk;
    reg Ior;
    wire [15:0]Rdata;
    reg Key_Clk;
    reg [3:0]Line;
    wire [3:0]Col;
    
    Keypad keyboard(Clk,Reset,Ior,Cs,Address,Rdata,Line,Col);
    
    always
    begin
        Key_Clk=0;
        #1;
        Key_Clk=1;
        #1;
     end
     
     always
     begin
        Reset=1;//置零信号有效
        #5;
        //不片选
        Reset=0;
        Address=0;
        Cs=0;
        Ior=0;
        Line=0;
        #5;
        
        while(Reset==1'b0)
        begin
            Cs=1;
            Ior=1;
            Address=0;
            Clk=1;
            #5;
            Clk=0;
            if(Rdata[0]==1'b1)//读取键值
            begin
                Cs=1;
                Ior=1;
                Address=0;
                Clk=1;
                #5;
                
         end
      end
end  
 
endmodule
