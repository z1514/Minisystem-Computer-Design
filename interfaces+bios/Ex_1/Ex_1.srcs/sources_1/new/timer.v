`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 21:17:19
// Design Name: 
// Module Name: timer
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


module timer( input Reset,input[2:0]Address,input Cs,input Clk,input Iow,input Ior,input[15:0] Wdata,output reg [15:0] Rdata,input Pulse0,input Pulse1, 
output reg Cout0,output reg Cout1
    );
    //0号定时器定义
    reg[15:0] initial_counter_reg0;//0号初值计数器
    wire[15:0] state_reg0;//0号状态计数器
    reg[15:0] function_reg0;//0号方式计数器
    reg[15:0] current_value_reg0;//0号当前值计数器
    reg timer0_mode;//0号计数器的工作方式：0表示定时，1表示计数，方式寄存器的0位
    reg state0_wire15_Count=0;
    reg state0_wire15_Timer=0;
    wire state0_wire15;//0号计数器的状态寄存器的15位
    reg state0_wire1;//0号计数器的状态寄存器的1位
    reg state0_wire0;//0号计数器的状态寄存器的0位
    assign state0_wire15=state0_wire15_Count|state0_wire15_Timer;//状态寄存器的15位表示定时/计数有效/无效
    assign state_reg0={state0_wire15,13'd0,state0_wire1,state0_wire0};
    reg timer0_read=0;//0号定时器的读信号
    reg timer0_write=0;//0号定时器的写信号
    reg keep_count_reg0=1;//0号记时器是否循环计数
    reg keep_timer_reg0=1;//0号定时器是否循环计数
    //结束0号计数器/定时器的定义
    
     //1号定时器定义
       reg[15:0] initial_counter_reg1;//0号计数器初值寄存器
       wire[15:0] state_reg1;//1号计数器状态寄存器
       reg[15:0] function_reg1;//1号计数器方式寄存器
       reg[15:0] current_value_reg1;//0号计数器当前值寄存器
       reg timer1_mode;//1号计数器的工作方式：0表示定时，1表示计数，方式寄存器的0位
       reg state1_wire15_Count=0;
       reg state1_wire15_Timer=0;
       wire state1_wire15;//1号计数器的状态寄存器的15位
       reg state1_wire1;//1号计数器的状态寄存器的1位
       reg state1_wire0;//1号计数器的状态寄存器的0位
       assign state1_wire15=state1_wire15_Count|state1_wire15_Timer;//状态寄存器的15位表示定时/计数有效/无效
       assign state_reg1={state1_wire15,13'd0,state1_wire1,state1_wire0};
       reg timer1_read=0;//1号定时器的读信号
       reg timer1_write=0;//1号定时器的写信号
       reg keep_count_reg1=1; 
       reg keep_timer_reg1=1;
       //结束1号计数器/定时器的定义
       
       always@(posedge Clk or posedge Reset)//Reset上升沿有效
       begin
          if(Reset==1)
        begin
            timer0_read=0;
            timer1_read=0;
        end
        else if(Cs==1'b1)//表示选中外设
            begin
            if(Iow==1'b1)//表示写外设
                begin
                timer0_read=0;
                timer1_read=0;
                case(Address[2:0])
                    3'b000:begin
                        function_reg0[15:0]=Wdata[15:0];//写0号定时器的方式寄存器
                        timer0_write=1;//写0号定时器
                        timer1_write=0;//1号定时器的写信号无效
                        end
                    3'b010:begin
                        function_reg1[15:0]=Wdata[15:0];//写1号定时器的方式寄存器
                        timer0_write=0;//0号定时器的写信号无效
                        timer1_write=1;//1号定时器的写信号有效
                        end
                    3'b100:begin
                        initial_counter_reg0[15:0]=Wdata[15:0];//写0号定时器的初值寄存器
                        timer0_write=1;//
                        timer1_write=0;
                        end
                   3'b110:begin
                        initial_counter_reg1[15:0]=Wdata[15:0];//写1号定时器的初值寄存器
                        timer0_write=0;
                        timer1_write=1;
                        end
                  default:
                       begin
                            timer0_write = 0;
                            timer1_write=0;
                       end
                  endcase
                  end 
       else if(Ior==1'b1)//读
            begin
                timer0_write=0;
                timer1_write=0;
            case(Address[2:0])
                3'b000:begin
                    Rdata[15:0]=state_reg0[15:0];
                    timer0_read=1;
                    timer1_read=0;
                    end
                3'b010:begin
                    Rdata[15:0]=state_reg1[15:0];
                    timer0_read=0;
                    timer1_read=1;
                    end
                3'b100:begin
                    Rdata[15:0]=current_value_reg0[15:0];
                    end
               3'b110:begin//读计时器1的当前计数寄存器值
                    Rdata[15:0]=current_value_reg1[15:0]; 
                    end
               default:begin
                    timer0_read=0;
                    timer1_read=0;
                    end
         endcase
      end//end if Ior=1'b1
      else//end if Ior!=1'b1并且Iow!=1'b1
        begin
           timer0_read=0;
           timer1_read=0;
           timer0_write=0;
           timer1_write=0;
       end
      end// end if Cs=1
      else 
        begin
            timer0_read=0;
            timer1_read=0;
            timer0_write=0;
            timer1_write=0; 
         end
    end 
    
    always@(posedge  Pulse0 or posedge Reset)//0号计数器计时
    begin//Reset上升沿有效
       if(Reset==1'b1)
         begin
            state0_wire15_Count=1'b0;//状态寄存器计数位无效
            current_value_reg0[15:0]=0;
            keep_count_reg0=1;
        end
       else
        begin
            if(function_reg0[0]==1'b1&&keep_count_reg0==1'b1)//当前是计数模式
            begin
                if(current_value_reg0[15:0]<initial_counter_reg0[15:0])
                begin
                    current_value_reg0=current_value_reg0+1;
                    state0_wire15_Count=1'b1;//计数有效
                    state0_wire1=0;//表示计数未到
                 end
                 else
                    begin
                        current_value_reg0=0;
                        if(timer0_read==1'b0)
                            state0_wire1=1;//如果当前没有读过状态寄存器,表示计数到
                        else
                            state0_wire1=0;
                         if(function_reg0[1]==1'b0)//判断当前是否是循环计数
                            begin
                                keep_count_reg0=0;
                                state0_wire15_Count=1'b0;//一次循环结束，下一次循环没有开始
                             end
                             else
                                begin
                                   keep_count_reg0=1;
                                   state0_wire15_Count=1'b1;//一次循环结束，还有下次循环
                                 end
                       end
                  end
              end
          end
     always@(posedge Clk or posedge Reset)//0号定时器的定时功能
     begin
        if(Reset==1'b1)
            begin
                Cout0=1;//定时器平时缺省输出为1
                state0_wire15_Timer=1'b0;//表示定时/计数无效
                state0_wire0=1'b0;
                keep_timer_reg0=1;
                current_value_reg0[15:0]=15'b0;
             end
             else if(timer0_write==1'b1)//表明当前定时器的值被重新写入
                begin
                    current_value_reg0[15:0]=initial_counter_reg0[15:0];
                    keep_timer_reg0=1;
                end
             else 
                begin
                    if(function_reg0[0]==1'b0&&keep_timer_reg0==1'b1)
                        begin
                            if(current_value_reg0[15:0]>16'b1)//检查当前计数值的大小和1的相关大小
                                begin
                                    Cout0=1;
                                    current_value_reg0[15:0]=current_value_reg0[15:0]-1;
                                    state0_wire15_Timer=1'b1;//此时计数有效
                           end
                           else if(current_value_reg0[15:0]==16'd1)
                            begin
                                Cout0=1;//输出一个低电平表示倒计时完成
                                current_value_reg0[15:0]=current_value_reg0[15:0]-1;
                                if(timer0_read==1'b0)
                                    state0_wire0=1'b1;//如果没有读过状态寄存器，则最低位设置为1
                                else
                                    state0_wire0=1'b0;
                             end
                             else//此时计数器的值为0
                                begin
                                    Cout0=1; 
                                    current_value_reg0[15:0]=initial_counter_reg0[15:0];
                                    if(function_reg0[1]==1'b0)
                                        keep_timer_reg0=1'b0;
                                    else 
                                        keep_timer_reg0=1'b1;//继续循环运行
                                  end
                            end
                        else if(keep_timer_reg0==1'b0)//表示不循环计数
                        begin
                            state0_wire15_Timer=1'b0;//定时/计数无效
                        end
                   end
           end
  
           
         always@(posedge  Pulse1 or posedge Reset)//1号计数器计时
           begin//Reset上升沿有效
              if(Reset==1'b1)
                begin
                   state1_wire15_Count=1'b0;//状态寄存器计数位无效
                   current_value_reg1[15:0]=0;
                   keep_count_reg1=1;
               end
              else
               begin
                   if(function_reg1[0]==1'b1&&keep_count_reg1==1'b1)//当前是计数模式
                   begin
                       if(current_value_reg1[15:0]<initial_counter_reg1[15:0])
                       begin
                           current_value_reg1=current_value_reg1+1;
                           state1_wire15_Count=1'b1;//计数有效
                           state1_wire1=0;//表示计数未到
                        end
                        else
                           begin
                               current_value_reg1=0;
                               if(timer1_read==1'b0)
                                   state1_wire1=1;//如果当前没有读过状态寄存器,表示计数到
                               else
                                   state1_wire1=0;
                                if(function_reg1[1]==1'b0)//判断当前是否是循环计数
                                   begin
                                       keep_count_reg1=0;
                                       state1_wire15_Count=1'b0;//一次循环结束，下一次循环没有开始
                                    end
                                    else
                                       begin
                                          keep_count_reg1=1;
                                          state1_wire15_Count=1'b1;//一次循环结束，还有下次循环
                                        end
                              end
                         end
                     end
                 end
            always@(posedge Clk or posedge Reset)//0号定时器的定时功能
            begin
               if(Reset==1'b1)
                   begin
                       Cout1=1;//定时器平时缺省输出为1
                       state1_wire15_Timer=1'b0;//表示定时/计数无效
                       state1_wire0=1'b0;
                       keep_timer_reg1=1;
                       current_value_reg1[15:0]=15'b0;
                    end
                    else if(timer1_write==1'b1)//表明当前定时器的值被重新写入
                       begin
                           current_value_reg1[15:0]=initial_counter_reg1[15:0];
                           keep_timer_reg1=1;
                       end
                    else 
                       begin
                           if(function_reg1[0]==1'b0&&keep_timer_reg1==1'b1)
                               begin
                                   if(current_value_reg1[15:0]>16'b1)//检查当前计数值的大小和1的相关大小
                                       begin
                                           Cout1=1;
                                           current_value_reg1[15:0]=current_value_reg1[15:0]-1;
                                           state1_wire15_Timer=1'b1;//此时计数有效
                                  end
                                  else if(current_value_reg1[15:0]==16'd1)
                                   begin
                                       Cout1=1;//输出一个低电平表示倒计时完成
                                       current_value_reg1[15:0]=current_value_reg1[15:0]-1;
                                       if(timer1_read==1'b0)
                                           state1_wire0=1'b1;//如果没有读过状态寄存器，则最低位设置为1
                                       else
                                           state1_wire0=1'b0;
                                    end
                                    else//此时计数器的值为0
                                       begin
                                           Cout1=1; 
                                           current_value_reg1[15:0]=initial_counter_reg1[15:0];
                                           if(function_reg1[1]==1'b0)
                                               keep_timer_reg1=1'b0;
                                           else 
                                               keep_timer_reg1=1'b1;//继续循环运行
                                         end
                                   end
                               else if(keep_timer_reg1==1'b0)//表示不循环计数
                               begin
                                   state1_wire15_Timer=1'b0;//定时/计数无效
                               end
                          end
                  end
                             
endmodule




////参考代码
//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2017/12/13 21:32:11
//// Design Name: 
//// Module Name: dev_timer
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


//module dev_timer(
//input Reset,input [2:0] Address,input Cs,input Clk,input Iow,input Ior ,input [15:0] Wdata, output reg [15:0] Rdata,input Pulse0 ,input Pulse1,output reg Cout0,output reg Cout1
///*output [15:0] state_reg0,output [15:0] function_reg0,output [15:0] cur_value_reg0,output [15:0] cur_cnt_value_reg0,output run_one_period0,output refresh_reg0*/
//);
    
//    //0号定时器定义
//    reg [15:0] target_counter_reg0;//0号定时器 初值寄存器
//    wire [15:0] state_reg0;//0号定时器 状态寄存器
//    reg [15:0] function_reg0;//0号定时器 方式寄存器
//    reg [15:0] cur_value_reg0;//0号定时器 当前计数值
//    reg timer0_mode;//表示0号定时器当前工作方式 0表示计数  1表示定时
//    reg [15:0] cur_cnt_value_reg0; // 0号定时器的计数寄存器
//    reg run_one_period0 = 1; //控制一次循环后计时是否继续 如果一次循环不继续的话 该bit为0
//    reg state0_wire_15Cnt=0;
//    reg state0_wire_15Timer=0;
//    wire state0_wire_15;
//    reg state0_wire_1=0;
//    reg state0_wire_0=0;
//    assign state0_wire_15 = state0_wire_15Cnt | state0_wire_15Timer; //15号工作状态指示位
//    assign state_reg0[15:0] = {state0_wire_15,13'd0,state0_wire_1,state0_wire_0};
//    reg refresh_reg0;
//    reg keep_on_cnt_reg0 = 1;
//    reg timer0_read=0;
//    //结束0号定时器定义
    
    
//    //1号定时器定义
//    reg [15:0] target_counter_reg1;//0号定时器 初值寄存器
//    wire [15:0] state_reg1;//0号定时器 状态寄存器
//    reg [15:0] function_reg1;//0号定时器 方式寄存器
//    reg [15:0] cur_value_reg1;//0号定时器 当前计数值
//    reg timer1_mode;//表示0号定时器当前工作方式 0表示计数  1表示定时
//    reg [15:0] cur_cnt_value_reg1; // 0号定时器的计数寄存器
//    reg run_one_period1 = 1; //控制一次循环后计时是否继续 如果一次循环不继续的话 该bit为0
//    reg state1_wire_15Cnt=0;
//    reg state1_wire_15Timer=0;
//    wire state1_wire_15;
//    reg state1_wire_1=0;
//    reg state1_wire_0=0;
//    assign state1_wire_15 = state1_wire_15Cnt | state1_wire_15Timer; //15号工作状态指示位
//    assign state_reg1[15:0] = {state1_wire_15,13'd0,state1_wire_1,state1_wire_0};
//    reg refresh_reg1;
//    reg keep_on_cnt_reg1 = 1;
//    reg timer1_read=0;
//    //结束1号定时器定义
    
//    always @(posedge Clk or negedge Reset) //要考虑时钟边沿因素 我这里暂时没有考虑
//    begin
//        if(Reset==0)
//        begin
//                timer0_read = 0;
//                timer1_read = 0;
//            end
//        else if(Cs==1'b1)//选中外设
//        begin
//            if(Iow==1'b1)//写寄存器操作
//                begin
//                    timer0_read = 0;
//                    timer1_read = 0;
//                    case(Address[2:0])
//                        3'b000: begin
//                                    function_reg0[15:0] = Wdata[15:0]; //写0号定时器的方式寄存器
//                                    refresh_reg0 = 1;
//                                    refresh_reg1 = 0;
//                                                                        //这里会有潜在的bug  如果设定为不循环模式 那么一次工作完成后将会无法开启第二次工作
//                                    //需要在这里每次检测到写方式寄存器的时候进行 使能工作位 keep_on_xx_reg0 为1 可以用一个或门
//                                    //需要在这里每次检测到写方式寄存器的时候进行 使能工作位 keep_on_xx_reg0 为1 可以用一个或门
//                                end
//                        3'b010: begin
//                                    function_reg1[15:0] = Wdata[15:0]; //写1号定时器的方式寄存器
//                                    refresh_reg0 = 0;
//                                    refresh_reg1 = 1;
//                                end
//                        3'b100: begin
//                                    target_counter_reg0[15:0] = Wdata[15:0] ; //写0号定时器的初值寄存器
//                                    refresh_reg0 = 1;
//                                    refresh_reg1 = 0;
//                                end
//                        3'b110: begin
//                                    target_counter_reg1[15:0] = Wdata[15:0] ; //写1号定时器的初值寄存器
//                                    refresh_reg0 = 0;
//                                    refresh_reg1 = 1;
//                                end
                        
//                        default:
//                                begin
//                                    refresh_reg0 = 0;
//                                    refresh_reg1 = 0;
//                                end
//                    endcase
//                end
//            else if(Ior == 1'b1)//读寄存器操作
//                begin
//                    refresh_reg0 = 0;
//                    refresh_reg1 = 0;
//                    case(Address[2:0])//判断寄存器地址
//                        3'b000: begin //读定时器0的状态寄存器
//                                      Rdata[15:0] = state_reg0[15:0] ; //读0号定时器的状态寄存器
//                                      //state0_wire_1 = 0; state0_wire_0=0;//state_reg0[14:0] = 0;//读后清零寄存器 保留了最高位查看是否开始工作
//                                      timer0_read = 1;
//                                      timer1_read = 0;
//                                end
//                        3'b010: begin //读定时器1的状态寄存器
//                                      Rdata[15:0] = state_reg1[15:0] ; //读1号定时器的状态寄存器
//                                      //state1_wire_1 = 0; state1_wire_0=0;//读后清零寄存器 保留了最高位查看是否开始工作
//                                      timer0_read = 0;                             
//                                      timer1_read = 1;
//                                end
//                        3'b100:begin //读定时器0的当前值寄存器
//                                      Rdata[15:0] = cur_value_reg0[15:0];
//                               end
//                        3'b110:begin //读定时器1的当前值寄存器
//                                      Rdata[15:0] = cur_value_reg1[15:0];
//                               end
//                        3'b111:begin
//                                      Rdata[15:0] = 16'h1234;
//                               end
//                        default: begin
//                                    timer0_read = 0;
//                                    timer1_read = 0;
//                                 end 
//                    endcase
//                end
//            else 
//                begin
//                    timer0_read = 0;
//                    timer1_read = 0;
//                    refresh_reg0 = 0;
//                    refresh_reg1 = 0;
//                end
//        end
//        else begin
//            timer0_read = 0;
//            timer1_read = 0;
//            refresh_reg0 = 0;
//            refresh_reg1 = 0;
//        end
//    end

   
//    always @(posedge Pulse0 or negedge Reset)//定时器0计数模式
//    begin
//        if(Reset == 1'b0)
//            begin
//                state0_wire_15Cnt = 1'b0;//正在运行指示位  
//                cur_cnt_value_reg0[15:0] = 0;  
//                keep_on_cnt_reg0 = 1;          
//            end
//        else//Pulse0 == 1'b1 
//            begin
//                if(function_reg0[0]==1'b1 && keep_on_cnt_reg0==1'b1)//出现一个脉冲 并且当前是计数模式
//                begin
//                    if( cur_cnt_value_reg0[15:0] < target_counter_reg0[15:0] )
//                        begin
//                            cur_cnt_value_reg0 = cur_cnt_value_reg0 + 1; //每来一次脉冲 进行自增
//                            state0_wire_15Cnt = 1'b1;    //给工作状态位赋值1
//                            state0_wire_1 = 0; //计数未到
//                        end
//                    else
//                        begin
//                            cur_cnt_value_reg0 = 0;
//                            if(timer0_read==1'b0)//如果当前没有读过寄存器
//                                state0_wire_1 = 1; //计数到
//                            else 
//                                state0_wire_1 = 0;

//                            if(function_reg0[1] == 1'b0)//判断当前是否是循环模式
//                                begin
//                                    keep_on_cnt_reg0 = 0;
//                                    state0_wire_15Cnt = 1'b0;//一次循环结束 没有下次循环 设定工作状态变为0
//                                end
//                            else
//                                begin
//                                    keep_on_cnt_reg0 = 1;
//                                    state0_wire_15Cnt = 1'b1;//一次循环结束 还有下次循环 设定工作状态为1
//                                end
//                        end
//                end
//            end
//     end

    
//    always @(posedge Clk or negedge Reset)//定时器0 定时功能
//    begin
//        if(Reset == 1'b0)
//            begin
//                Cout0 = 1;//两个定时器缺省输出为高电平 当出现定时中断时低电平
//                state0_wire_15Timer = 1'b0;//正在运行指示位
//                state0_wire_0 = 1'b0;//定时到指示位
//                run_one_period0 = 1;
//                cur_value_reg0[15:0]=0;
//            end
//        else if(refresh_reg0 ==  1'b1)//刷新当前定时器的值
//            begin
//                cur_value_reg0[15:0]=target_counter_reg0[15:0];
//                run_one_period0 = 1;
//            end
//        else
//            begin
//                if(function_reg0[0]==1'b0 && run_one_period0==1'b1) //方式寄存器0表示定时 1表示计数
//                    begin
//                        //定时器模式  计数器减一一直到1 然后设置状态位为1 cout输出一个低电平脉冲
//                        if(cur_value_reg0[15:0]>16'd1)
//                            begin
//                                Cout0 = 1;
//                                cur_value_reg0[15:0] = cur_value_reg0[15:0] - 1;
//                                state0_wire_15Timer = 1'b1;//最高位为1 表示正在计数或者定时
//                            end
//                        else if(cur_value_reg0[15:0] == 16'd1)
//                            begin
//                                Cout0 = 0;//输出一个低电平
//                                cur_value_reg0[15:0] = cur_value_reg0[15:0] - 1;
//                                if(timer0_read==1'b0)//如果当前没有读过寄存器
//                                    state0_wire_0 = 1'b1;//最低位设置为1 表示定时到
//                                else 
//                                    state0_wire_0 = 1'b0;
//                            end
//                        else
//                            begin
//                                Cout0 = 1;
//                                cur_value_reg0[15:0] = target_counter_reg0[15:0];//将初值寄存器的值给当前值寄存器
//                                //state0_wire_0 = 1'b0;//保持0bit为1 表示上一次计数完成
//                                if(function_reg0[1]==1'b0)
//                                    run_one_period0 = 1'b0;//只运行一次就停止
//                                else
//                                    run_one_period0 = 1'b1;//继续循环运行
//                            end
//                    end
//                 else if(run_one_period0 == 1'b0)//run_one_period0 == 0 表示不再运行了
//                    begin
//                        state0_wire_15Timer = 1'b0;//表示目前不在运行
//                    end
//            end
//    end

//    always @(posedge Pulse1 or negedge Reset)//定时器1计数模式
//    begin
//        if(Reset == 1'b0)
//            begin
//                state1_wire_15Cnt = 1'b0;//正在运行指示位  
//                cur_cnt_value_reg1[15:0] = 0;  
//                keep_on_cnt_reg1 = 1;        
//            end
//        else//Pulse0 == 1'b1 
//            begin
//                if(function_reg1[0]==1'b1 && keep_on_cnt_reg1==1'b1)//出现一个脉冲 并且当前是计数模式
//                begin
//                    if( cur_cnt_value_reg1[15:0] < target_counter_reg1[15:0] )
//                        begin
//                            cur_cnt_value_reg1 = cur_cnt_value_reg1 + 1; //每来一次脉冲 进行自增
//                            state1_wire_15Cnt = 1'b1;    //给工作状态位赋值1
//                            state1_wire_1 = 0; //计数未到
//                        end
//                    else
//                        begin
//                            cur_cnt_value_reg1 = 0;
//                            if(timer1_read == 1'b0)
//                                state1_wire_1 = 1; //计数到
//                            else
//                                state1_wire_1 = 0;

//                            if(function_reg1[1] == 1'b0)//判断当前是否是循环模式
//                                begin
//                                    keep_on_cnt_reg1 = 0;
//                                    state1_wire_15Cnt = 1'b0;//一次循环结束 没有下次循环 设定工作状态变为0
//                                end
//                            else
//                                begin
//                                    keep_on_cnt_reg1 = 1;
//                                    state1_wire_15Cnt = 1'b1;//一次循环结束 还有下次循环 设定工作状态为1
//                                end
//                        end
//                end
//            end
//     end

    
//    always @(posedge Clk or negedge Reset)//定时器1 定时功能
//    begin
//        if(Reset == 1'b0)
//            begin
//                Cout1 = 1;//两个定时器缺省输出为高电平 当出现定时中断时低电平
//                state1_wire_15Timer = 1'b0;//正在运行指示位
//                state1_wire_0 = 1'b0;//定时到指示位
//                run_one_period1 = 1;
//                cur_value_reg1[15:0]=0;
//            end
//        else if(refresh_reg1 ==  1'b1)//刷新当前定时器的值
//            begin
//                cur_value_reg1[15:0]=target_counter_reg1[15:0];
//                run_one_period1 = 1;
//            end
//        else
//            begin
//                if(function_reg1[0]==1'b0 && run_one_period1==1'b1) //方式寄存器0表示定时 1表示计数
//                    begin
//                        //定时器模式  计数器减一一直到1 然后设置状态位为1 cout输出一个低电平脉冲
//                        if(cur_value_reg1[15:0]>16'd1)
//                            begin
//                                Cout1 = 1;
//                                cur_value_reg1[15:0] = cur_value_reg1[15:0] - 1;
//                                state1_wire_15Timer = 1'b1;//最高位为1 表示正在计数或者定时
//                            end
//                        else if(cur_value_reg1[15:0] == 16'd1)
//                            begin
//                                Cout1 = 0;//输出一个低电平
//                                cur_value_reg1[15:0] = cur_value_reg1[15:0] - 1;
//                                if(timer1_read==1'b0)   
//                                    state1_wire_0 = 1'b1;//最低位设置为1 表示定时到
//                                else 
//                                    state1_wire_0 = 1'b0;
//                            end
//                        else
//                            begin
//                                Cout1 = 1;
//                                cur_value_reg1[15:0] = target_counter_reg1[15:0];//将初值寄存器的值给当前值寄存器
//                                //state0_wire_0 = 1'b0;//保持0bit为1 表示上一次计数完成
//                                if(function_reg1[1]==1'b0)
//                                    run_one_period1 = 1'b0;//只运行一次就停止
//                                else
//                                    run_one_period1 = 1'b1;//继续循环运行
//                            end
//                    end
//                 else if(run_one_period1 == 1'b0)//run_one_period0 == 0 表示不再运行了
//                    begin
//                        state1_wire_15Timer = 1'b0;//表示目前不在运行
//                    end
//            end
//    end



//endmodule
