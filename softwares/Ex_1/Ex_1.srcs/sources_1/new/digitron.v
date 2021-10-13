`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2020/12/05 21:19:39
//// Design Name: 
//// Module Name: digitron
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////

module digitron(
input Reset,
input [2:0] Address,
input Cs,
input Clk,
input Iow,
input [15:0] Wdata,
output reg [7:0] digital,
output reg [7:0] ens,
output reg [15:0] ctrl_data,
output reg [7:0]data_ens);

wire segment_clock;
Segment_Clock segment_Clock(Reset,Clk,200000,segment_clock);
reg[15:0] low4_data;
reg[15:0] high4_data;
reg[3:0] count=0;
reg[3:0] sw=0;//所表示的数字是几
wire[31:0] datas;
reg [7:0] dots_ens;//八位小数点使能信号
//wire[7:0] data_ens;//八位数字使能信号

assign datas={high4_data,low4_data};


always @(posedge Clk or posedge Reset)
begin 
    if(Reset==1)//Reset信号高电平有效
        begin
            low4_data[15:0]=16'd0;
            high4_data[15:0]=16'd0;
            ctrl_data[15:0]=16'd0;
        end
    else if((Cs==1'b1)&&(Iow==1'b1))
        begin
            case(Address[2:0])//根据地址判断数据是高四位数据还是低四位数据，还是控制信号
               3'b000: low4_data[15:0] = Wdata[15:0];//低四位数据
               3'b010: high4_data[15:0] = Wdata[15:0];//高四位数据
               3'b100:
               begin 
               ctrl_data[15:0] = Wdata[15:0];//控制信号数据
               data_ens=ctrl_data[15:8];//控制信号的高八位是数字使能信号
               dots_ens=ctrl_data[7:0];
               end
            endcase
        end
end

reg dot_enable_data=0;
always @(posedge segment_clock or posedge Reset)
begin
    if(Reset==1)
        begin
            ens=8'b1111_1111;
            count<=4'b0000;
            sw<=4'b0000;
        end
     else 
        begin
        if(count==0)
            begin
                ens={7'b111_1111,~data_ens[0]};
                count<=count+1;
                sw<=datas[3:0];
                dot_enable_data<=dots_ens[0];
            end
         else if(count==1)
               begin
                  ens={6'b11_1111,~data_ens[1],1'b1};
                  count<=count+1;
                  sw<=datas[7:4];
                  dot_enable_data<=dots_ens[1];
               end
        else if(count==2)
            begin
                ens={5'b1_1111,~data_ens[2],2'b11};
                count<=count+1;
                sw<=datas[11:8];
                dot_enable_data<=dots_ens[2];
            end          
         else if(count==3)
             begin
               ens={4'b1111,~data_ens[3],3'b111};
               count<=count+1;
               sw<=datas[15:12];
               dot_enable_data<=dots_ens[3];
             end                                
         else if(count==4)
            begin
              ens={3'b111,~data_ens[4],4'b1111};
              count<=count+1;
              sw<=datas[19:16];
               dot_enable_data<=dots_ens[4];
            end  
          else if(count == 5)
            begin
              ens={2'b11,~data_ens[5],5'b11111};
              count <= count  + 1;
              sw<=datas[23:20];
              dot_enable_data<=dots_ens[5];
             end                                                                     
           else if(count == 6)
             begin
               ens={1'b1,~data_ens[6],6'b111111};
               count <= count  + 1;
               sw<=datas[27:24];
               dot_enable_data<=dots_ens[6];
              end
            else if(count == 7)
              begin
                ens={~data_ens[7],7'b1111111};
                count <= 0;
                sw<=datas[31:28];
                dot_enable_data<=dots_ens[7];
               end              
       end
 end
 always @(sw)
 begin
      case(sw)
              4'd0:digital=8'b00000011&{7'b1111111,~dot_enable_data};//0的七段表示，CA~CG
              4'd1:digital=8'b10011111&{7'b1111111,~dot_enable_data};
              4'd2:digital=8'b00100101&{7'b1111111,~dot_enable_data};
              4'd3:digital=8'b00001101&{7'b1111111,~dot_enable_data};
              4'd4:digital=8'b10011001&{7'b1111111,~dot_enable_data};
              4'd5:digital=8'b01001001&{7'b1111111,~dot_enable_data};
              4'd6:digital=8'b01000001&{7'b1111111,~dot_enable_data};
              4'd7:digital=8'b00011111&{7'b1111111,~dot_enable_data};
              4'd8:digital=8'b00000001&{7'b1111111,~dot_enable_data};
              4'd9:digital=8'b00001001&{7'b1111111,~dot_enable_data};
              4'ha:digital=8'b00010001&{7'b1111111,~dot_enable_data};
              4'hb:digital=8'b11000001&{7'b1111111,~dot_enable_data};
              4'hc:digital=8'b01100011&{7'b1111111,~dot_enable_data};
              4'hd:digital=8'b10000101&{7'b1111111,~dot_enable_data};
              4'he:digital=8'b01100001&{7'b1111111,~dot_enable_data};
              4'hf:digital=8'b01110001&{7'b1111111,~dot_enable_data};
          default:
              digital=8'b0;
       endcase  
  end
 endmodule      

