`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/07 11:00:17
// Design Name: 
// Module Name: Keyboard
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


//module Keyboard(

//    );
//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Keypad(
    input        Clk,          
    input        Rst,
    input         Ior,
    input         Cs,
    input [1:0]addr,
    output reg [15:0]  Rdata,
    input  [3:0]  Row,
    output reg [3:0]  Col
);
    reg         keysta;//键盘状态1表示有键按下
    reg  [3:0]  keynum;
    reg         vaild;
    reg         keyhold;//作用与keysta类似
    reg  [7:0]  keyvalue = 8'b0000_0000;
    reg  [25:0]  counter_clk = 0;
    //assign Rdata = {12'b0,keynum};//改变之后的输出数据信号只有keynum这一信息；数据信号（keysta,valid,keynum:键值）

    reg [1:0] next_state;
    reg [1:0] state;
    parameter [1:0]  scan    = 2'b01,
                      waitend = 2'b10;   //wait to end
                    
    always @ (posedge Clk or posedge Rst) begin
        if(Rst) 
        begin
            keysta<=0;//此时没有键按下
            state <= scan;//wb_rst_i复位信号
        end 
        else begin
            state <= next_state;
            case(addr[1:0])
            2'b00:Rdata<={12'b0,keynum};
            2'b10:Rdata<={15'b0,keysta};
            endcase
        end
    end 
    
    always @ * begin
        if(Rst) begin
            keysta<=0;
            vaild = 0;
            next_state = scan;  
        end else 
            case(state) 
           scan:begin
           if(keysta&(Cs))begin
           next_state=waitend;//按下且读取
           vaild=0;//Valid表示有有效键值
           end else begin next_state=scan;
          end//完成手册中键盘消抖状态转换图的状态转换，注意对键值有效位的赋值
          end
          waitend:begin
          if(counter_clk>2000000)begin
//          counter_clk=0;
          next_state=scan;
          vaild=1;  
          end else begin next_state=waitend;end
          end
            endcase
        end     
    
   always @(posedge Clk) begin
//     if(counter_clk < 2000000) begin   //200ms
   if(counter_clk < 200) begin   //仿真用时钟   
//        counter_clk = counter_clk + 1; 
         //继续扫描，检测按键是否持续按下
            Col <= keyvalue[7:4];
          if(Row==keyvalue[3:0]) begin
             keyhold <= 1;
               end else begin
                  keyhold <= 0;
               end          
     end else begin
         case(Col)
          4'b0000:begin
          if(Row!=4'b1111)begin Col=4'b0111;end//如果这一列没有就索索下一列
          end
          4'b0111:begin
          if(Row==4'b1111)begin Col=4'b1011;end//说明没有行线输入
          else begin keyvalue[7:4]=Col;
          keyvalue[3:0]=Row;
          keysta=1;
          end
          end
          4'b1011:
          begin
          if(Row==4'b1111)begin Col=4'b1101;end
          else 
            begin 
                keyvalue[7:4]=Col;
                keyvalue[3:0]=Row;
                keysta=1;
            end
          end 
          4'b1101:begin
          if(Row==4'b1111)begin Col=4'b1110;end
           else begin keyvalue[7:4]=Col;
           keyvalue[3:0]=Row;
            keysta=1;
            end
            end 
            4'b1110:begin
            keyvalue[7:4]=Col;//先扫描列col，再扫描行row/line
            keyvalue[3:0]=Row;
            keysta=1;
            end
           default : begin Col <= 4'b0000; keysta <= 0;end           
           endcase
       end
   end
    
    always @* begin                           //键值译码
        case(keyvalue[3:0])               //col
            4'b1110: begin
                case(keyvalue[7:4])
                    4'b1110: keynum = 4'b0001; // 1
                    4'b1101: keynum = 4'b0100; // 4
                    4'b1011: keynum = 4'b0111; // 7
                    4'b0111: keynum = 4'b1110; // E
                    default: begin end         //多键按下不处理
                endcase
            end
              
            4'b1101: begin
               case(keyvalue[7:0])
               4'b1110: keynum = 4'b0010; // 2
               4'b1101: keynum = 4'b0101; // 5
               4'b1011: keynum = 4'b1000; // 8
               4'b0111: keynum = 4'b0000; // 0
               default: begin end 
            endcase
            end
            
            4'b1011: begin
            case(keyvalue[7:4])
              4'b1110:keynum = 4'b0011; // 3
              4'b1101: keynum = 4'b0110; // 5
               4'b1011: keynum = 4'b1001; // 9
                4'b0111: keynum = 4'b1111; // F
                default: begin end 
                 endcase
                end
            4'b0111: begin
            case(keyvalue[7:4])
             4'b1110: keynum = 4'b1010; // A
             4'b1101: keynum = 4'b1011; // B
               4'b1011: keynum = 4'b1100; // C
              4'b0111: keynum = 4'b1101; // D
              default: begin end         //多键按下不处理
                endcase
                          ///// save
                          /////                
                 end
           
           
           default: keynum = 4'b0;
        endcase
    end
	
endmodule

