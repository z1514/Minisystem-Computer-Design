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
    //0�Ŷ�ʱ������
    reg[15:0] initial_counter_reg0;//0�ų�ֵ������
    wire[15:0] state_reg0;//0��״̬������
    reg[15:0] function_reg0;//0�ŷ�ʽ������
    reg[15:0] current_value_reg0;//0�ŵ�ǰֵ������
    reg timer0_mode;//0�ż������Ĺ�����ʽ��0��ʾ��ʱ��1��ʾ��������ʽ�Ĵ�����0λ
    reg state0_wire15_Count=0;
    reg state0_wire15_Timer=0;
    wire state0_wire15;//0�ż�������״̬�Ĵ�����15λ
    reg state0_wire1;//0�ż�������״̬�Ĵ�����1λ
    reg state0_wire0;//0�ż�������״̬�Ĵ�����0λ
    assign state0_wire15=state0_wire15_Count|state0_wire15_Timer;//״̬�Ĵ�����15λ��ʾ��ʱ/������Ч/��Ч
    assign state_reg0={state0_wire15,13'd0,state0_wire1,state0_wire0};
    reg timer0_read=0;//0�Ŷ�ʱ���Ķ��ź�
    reg timer0_write=0;//0�Ŷ�ʱ����д�ź�
    reg keep_count_reg0=1;//0�ż�ʱ���Ƿ�ѭ������
    reg keep_timer_reg0=1;//0�Ŷ�ʱ���Ƿ�ѭ������
    //����0�ż�����/��ʱ���Ķ���
    
     //1�Ŷ�ʱ������
       reg[15:0] initial_counter_reg1;//0�ż�������ֵ�Ĵ���
       wire[15:0] state_reg1;//1�ż�����״̬�Ĵ���
       reg[15:0] function_reg1;//1�ż�������ʽ�Ĵ���
       reg[15:0] current_value_reg1;//0�ż�������ǰֵ�Ĵ���
       reg timer1_mode;//1�ż������Ĺ�����ʽ��0��ʾ��ʱ��1��ʾ��������ʽ�Ĵ�����0λ
       reg state1_wire15_Count=0;
       reg state1_wire15_Timer=0;
       wire state1_wire15;//1�ż�������״̬�Ĵ�����15λ
       reg state1_wire1;//1�ż�������״̬�Ĵ�����1λ
       reg state1_wire0;//1�ż�������״̬�Ĵ�����0λ
       assign state1_wire15=state1_wire15_Count|state1_wire15_Timer;//״̬�Ĵ�����15λ��ʾ��ʱ/������Ч/��Ч
       assign state_reg1={state1_wire15,13'd0,state1_wire1,state1_wire0};
       reg timer1_read=0;//1�Ŷ�ʱ���Ķ��ź�
       reg timer1_write=0;//1�Ŷ�ʱ����д�ź�
       reg keep_count_reg1=1; 
       reg keep_timer_reg1=1;
       //����1�ż�����/��ʱ���Ķ���
       
       always@(posedge Clk or posedge Reset)//Reset��������Ч
       begin
          if(Reset==1)
        begin
            timer0_read=0;
            timer1_read=0;
        end
        else if(Cs==1'b1)//��ʾѡ������
            begin
            if(Iow==1'b1)//��ʾд����
                begin
                timer0_read=0;
                timer1_read=0;
                case(Address[2:0])
                    3'b000:begin
                        function_reg0[15:0]=Wdata[15:0];//д0�Ŷ�ʱ���ķ�ʽ�Ĵ���
                        timer0_write=1;//д0�Ŷ�ʱ��
                        timer1_write=0;//1�Ŷ�ʱ����д�ź���Ч
                        end
                    3'b010:begin
                        function_reg1[15:0]=Wdata[15:0];//д1�Ŷ�ʱ���ķ�ʽ�Ĵ���
                        timer0_write=0;//0�Ŷ�ʱ����д�ź���Ч
                        timer1_write=1;//1�Ŷ�ʱ����д�ź���Ч
                        end
                    3'b100:begin
                        initial_counter_reg0[15:0]=Wdata[15:0];//д0�Ŷ�ʱ���ĳ�ֵ�Ĵ���
                        timer0_write=1;//
                        timer1_write=0;
                        end
                   3'b110:begin
                        initial_counter_reg1[15:0]=Wdata[15:0];//д1�Ŷ�ʱ���ĳ�ֵ�Ĵ���
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
       else if(Ior==1'b1)//��
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
               3'b110:begin//����ʱ��1�ĵ�ǰ�����Ĵ���ֵ
                    Rdata[15:0]=current_value_reg1[15:0]; 
                    end
               default:begin
                    timer0_read=0;
                    timer1_read=0;
                    end
         endcase
      end//end if Ior=1'b1
      else//end if Ior!=1'b1����Iow!=1'b1
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
    
    always@(posedge  Pulse0 or posedge Reset)//0�ż�������ʱ
    begin//Reset��������Ч
       if(Reset==1'b1)
         begin
            state0_wire15_Count=1'b0;//״̬�Ĵ�������λ��Ч
            current_value_reg0[15:0]=0;
            keep_count_reg0=1;
        end
       else
        begin
            if(function_reg0[0]==1'b1&&keep_count_reg0==1'b1)//��ǰ�Ǽ���ģʽ
            begin
                if(current_value_reg0[15:0]<initial_counter_reg0[15:0])
                begin
                    current_value_reg0=current_value_reg0+1;
                    state0_wire15_Count=1'b1;//������Ч
                    state0_wire1=0;//��ʾ����δ��
                 end
                 else
                    begin
                        current_value_reg0=0;
                        if(timer0_read==1'b0)
                            state0_wire1=1;//�����ǰû�ж���״̬�Ĵ���,��ʾ������
                        else
                            state0_wire1=0;
                         if(function_reg0[1]==1'b0)//�жϵ�ǰ�Ƿ���ѭ������
                            begin
                                keep_count_reg0=0;
                                state0_wire15_Count=1'b0;//һ��ѭ����������һ��ѭ��û�п�ʼ
                             end
                             else
                                begin
                                   keep_count_reg0=1;
                                   state0_wire15_Count=1'b1;//һ��ѭ�������������´�ѭ��
                                 end
                       end
                  end
              end
          end
     always@(posedge Clk or posedge Reset)//0�Ŷ�ʱ���Ķ�ʱ����
     begin
        if(Reset==1'b1)
            begin
                Cout0=1;//��ʱ��ƽʱȱʡ���Ϊ1
                state0_wire15_Timer=1'b0;//��ʾ��ʱ/������Ч
                state0_wire0=1'b0;
                keep_timer_reg0=1;
                current_value_reg0[15:0]=15'b0;
             end
             else if(timer0_write==1'b1)//������ǰ��ʱ����ֵ������д��
                begin
                    current_value_reg0[15:0]=initial_counter_reg0[15:0];
                    keep_timer_reg0=1;
                end
             else 
                begin
                    if(function_reg0[0]==1'b0&&keep_timer_reg0==1'b1)
                        begin
                            if(current_value_reg0[15:0]>16'b1)//��鵱ǰ����ֵ�Ĵ�С��1����ش�С
                                begin
                                    Cout0=1;
                                    current_value_reg0[15:0]=current_value_reg0[15:0]-1;
                                    state0_wire15_Timer=1'b1;//��ʱ������Ч
                           end
                           else if(current_value_reg0[15:0]==16'd1)
                            begin
                                Cout0=1;//���һ���͵�ƽ��ʾ����ʱ���
                                current_value_reg0[15:0]=current_value_reg0[15:0]-1;
                                if(timer0_read==1'b0)
                                    state0_wire0=1'b1;//���û�ж���״̬�Ĵ����������λ����Ϊ1
                                else
                                    state0_wire0=1'b0;
                             end
                             else//��ʱ��������ֵΪ0
                                begin
                                    Cout0=1; 
                                    current_value_reg0[15:0]=initial_counter_reg0[15:0];
                                    if(function_reg0[1]==1'b0)
                                        keep_timer_reg0=1'b0;
                                    else 
                                        keep_timer_reg0=1'b1;//����ѭ������
                                  end
                            end
                        else if(keep_timer_reg0==1'b0)//��ʾ��ѭ������
                        begin
                            state0_wire15_Timer=1'b0;//��ʱ/������Ч
                        end
                   end
           end
  
           
         always@(posedge  Pulse1 or posedge Reset)//1�ż�������ʱ
           begin//Reset��������Ч
              if(Reset==1'b1)
                begin
                   state1_wire15_Count=1'b0;//״̬�Ĵ�������λ��Ч
                   current_value_reg1[15:0]=0;
                   keep_count_reg1=1;
               end
              else
               begin
                   if(function_reg1[0]==1'b1&&keep_count_reg1==1'b1)//��ǰ�Ǽ���ģʽ
                   begin
                       if(current_value_reg1[15:0]<initial_counter_reg1[15:0])
                       begin
                           current_value_reg1=current_value_reg1+1;
                           state1_wire15_Count=1'b1;//������Ч
                           state1_wire1=0;//��ʾ����δ��
                        end
                        else
                           begin
                               current_value_reg1=0;
                               if(timer1_read==1'b0)
                                   state1_wire1=1;//�����ǰû�ж���״̬�Ĵ���,��ʾ������
                               else
                                   state1_wire1=0;
                                if(function_reg1[1]==1'b0)//�жϵ�ǰ�Ƿ���ѭ������
                                   begin
                                       keep_count_reg1=0;
                                       state1_wire15_Count=1'b0;//һ��ѭ����������һ��ѭ��û�п�ʼ
                                    end
                                    else
                                       begin
                                          keep_count_reg1=1;
                                          state1_wire15_Count=1'b1;//һ��ѭ�������������´�ѭ��
                                        end
                              end
                         end
                     end
                 end
            always@(posedge Clk or posedge Reset)//0�Ŷ�ʱ���Ķ�ʱ����
            begin
               if(Reset==1'b1)
                   begin
                       Cout1=1;//��ʱ��ƽʱȱʡ���Ϊ1
                       state1_wire15_Timer=1'b0;//��ʾ��ʱ/������Ч
                       state1_wire0=1'b0;
                       keep_timer_reg1=1;
                       current_value_reg1[15:0]=15'b0;
                    end
                    else if(timer1_write==1'b1)//������ǰ��ʱ����ֵ������д��
                       begin
                           current_value_reg1[15:0]=initial_counter_reg1[15:0];
                           keep_timer_reg1=1;
                       end
                    else 
                       begin
                           if(function_reg1[0]==1'b0&&keep_timer_reg1==1'b1)
                               begin
                                   if(current_value_reg1[15:0]>16'b1)//��鵱ǰ����ֵ�Ĵ�С��1����ش�С
                                       begin
                                           Cout1=1;
                                           current_value_reg1[15:0]=current_value_reg1[15:0]-1;
                                           state1_wire15_Timer=1'b1;//��ʱ������Ч
                                  end
                                  else if(current_value_reg1[15:0]==16'd1)
                                   begin
                                       Cout1=1;//���һ���͵�ƽ��ʾ����ʱ���
                                       current_value_reg1[15:0]=current_value_reg1[15:0]-1;
                                       if(timer1_read==1'b0)
                                           state1_wire0=1'b1;//���û�ж���״̬�Ĵ����������λ����Ϊ1
                                       else
                                           state1_wire0=1'b0;
                                    end
                                    else//��ʱ��������ֵΪ0
                                       begin
                                           Cout1=1; 
                                           current_value_reg1[15:0]=initial_counter_reg1[15:0];
                                           if(function_reg1[1]==1'b0)
                                               keep_timer_reg1=1'b0;
                                           else 
                                               keep_timer_reg1=1'b1;//����ѭ������
                                         end
                                   end
                               else if(keep_timer_reg1==1'b0)//��ʾ��ѭ������
                               begin
                                   state1_wire15_Timer=1'b0;//��ʱ/������Ч
                               end
                          end
                  end
                             
endmodule




////�ο�����
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
    
//    //0�Ŷ�ʱ������
//    reg [15:0] target_counter_reg0;//0�Ŷ�ʱ�� ��ֵ�Ĵ���
//    wire [15:0] state_reg0;//0�Ŷ�ʱ�� ״̬�Ĵ���
//    reg [15:0] function_reg0;//0�Ŷ�ʱ�� ��ʽ�Ĵ���
//    reg [15:0] cur_value_reg0;//0�Ŷ�ʱ�� ��ǰ����ֵ
//    reg timer0_mode;//��ʾ0�Ŷ�ʱ����ǰ������ʽ 0��ʾ����  1��ʾ��ʱ
//    reg [15:0] cur_cnt_value_reg0; // 0�Ŷ�ʱ���ļ����Ĵ���
//    reg run_one_period0 = 1; //����һ��ѭ�����ʱ�Ƿ���� ���һ��ѭ���������Ļ� ��bitΪ0
//    reg state0_wire_15Cnt=0;
//    reg state0_wire_15Timer=0;
//    wire state0_wire_15;
//    reg state0_wire_1=0;
//    reg state0_wire_0=0;
//    assign state0_wire_15 = state0_wire_15Cnt | state0_wire_15Timer; //15�Ź���״ָ̬ʾλ
//    assign state_reg0[15:0] = {state0_wire_15,13'd0,state0_wire_1,state0_wire_0};
//    reg refresh_reg0;
//    reg keep_on_cnt_reg0 = 1;
//    reg timer0_read=0;
//    //����0�Ŷ�ʱ������
    
    
//    //1�Ŷ�ʱ������
//    reg [15:0] target_counter_reg1;//0�Ŷ�ʱ�� ��ֵ�Ĵ���
//    wire [15:0] state_reg1;//0�Ŷ�ʱ�� ״̬�Ĵ���
//    reg [15:0] function_reg1;//0�Ŷ�ʱ�� ��ʽ�Ĵ���
//    reg [15:0] cur_value_reg1;//0�Ŷ�ʱ�� ��ǰ����ֵ
//    reg timer1_mode;//��ʾ0�Ŷ�ʱ����ǰ������ʽ 0��ʾ����  1��ʾ��ʱ
//    reg [15:0] cur_cnt_value_reg1; // 0�Ŷ�ʱ���ļ����Ĵ���
//    reg run_one_period1 = 1; //����һ��ѭ�����ʱ�Ƿ���� ���һ��ѭ���������Ļ� ��bitΪ0
//    reg state1_wire_15Cnt=0;
//    reg state1_wire_15Timer=0;
//    wire state1_wire_15;
//    reg state1_wire_1=0;
//    reg state1_wire_0=0;
//    assign state1_wire_15 = state1_wire_15Cnt | state1_wire_15Timer; //15�Ź���״ָ̬ʾλ
//    assign state_reg1[15:0] = {state1_wire_15,13'd0,state1_wire_1,state1_wire_0};
//    reg refresh_reg1;
//    reg keep_on_cnt_reg1 = 1;
//    reg timer1_read=0;
//    //����1�Ŷ�ʱ������
    
//    always @(posedge Clk or negedge Reset) //Ҫ����ʱ�ӱ������� ��������ʱû�п���
//    begin
//        if(Reset==0)
//        begin
//                timer0_read = 0;
//                timer1_read = 0;
//            end
//        else if(Cs==1'b1)//ѡ������
//        begin
//            if(Iow==1'b1)//д�Ĵ�������
//                begin
//                    timer0_read = 0;
//                    timer1_read = 0;
//                    case(Address[2:0])
//                        3'b000: begin
//                                    function_reg0[15:0] = Wdata[15:0]; //д0�Ŷ�ʱ���ķ�ʽ�Ĵ���
//                                    refresh_reg0 = 1;
//                                    refresh_reg1 = 0;
//                                                                        //�������Ǳ�ڵ�bug  ����趨Ϊ��ѭ��ģʽ ��ôһ�ι�����ɺ󽫻��޷������ڶ��ι���
//                                    //��Ҫ������ÿ�μ�⵽д��ʽ�Ĵ�����ʱ����� ʹ�ܹ���λ keep_on_xx_reg0 Ϊ1 ������һ������
//                                    //��Ҫ������ÿ�μ�⵽д��ʽ�Ĵ�����ʱ����� ʹ�ܹ���λ keep_on_xx_reg0 Ϊ1 ������һ������
//                                end
//                        3'b010: begin
//                                    function_reg1[15:0] = Wdata[15:0]; //д1�Ŷ�ʱ���ķ�ʽ�Ĵ���
//                                    refresh_reg0 = 0;
//                                    refresh_reg1 = 1;
//                                end
//                        3'b100: begin
//                                    target_counter_reg0[15:0] = Wdata[15:0] ; //д0�Ŷ�ʱ���ĳ�ֵ�Ĵ���
//                                    refresh_reg0 = 1;
//                                    refresh_reg1 = 0;
//                                end
//                        3'b110: begin
//                                    target_counter_reg1[15:0] = Wdata[15:0] ; //д1�Ŷ�ʱ���ĳ�ֵ�Ĵ���
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
//            else if(Ior == 1'b1)//���Ĵ�������
//                begin
//                    refresh_reg0 = 0;
//                    refresh_reg1 = 0;
//                    case(Address[2:0])//�жϼĴ�����ַ
//                        3'b000: begin //����ʱ��0��״̬�Ĵ���
//                                      Rdata[15:0] = state_reg0[15:0] ; //��0�Ŷ�ʱ����״̬�Ĵ���
//                                      //state0_wire_1 = 0; state0_wire_0=0;//state_reg0[14:0] = 0;//��������Ĵ��� ���������λ�鿴�Ƿ�ʼ����
//                                      timer0_read = 1;
//                                      timer1_read = 0;
//                                end
//                        3'b010: begin //����ʱ��1��״̬�Ĵ���
//                                      Rdata[15:0] = state_reg1[15:0] ; //��1�Ŷ�ʱ����״̬�Ĵ���
//                                      //state1_wire_1 = 0; state1_wire_0=0;//��������Ĵ��� ���������λ�鿴�Ƿ�ʼ����
//                                      timer0_read = 0;                             
//                                      timer1_read = 1;
//                                end
//                        3'b100:begin //����ʱ��0�ĵ�ǰֵ�Ĵ���
//                                      Rdata[15:0] = cur_value_reg0[15:0];
//                               end
//                        3'b110:begin //����ʱ��1�ĵ�ǰֵ�Ĵ���
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

   
//    always @(posedge Pulse0 or negedge Reset)//��ʱ��0����ģʽ
//    begin
//        if(Reset == 1'b0)
//            begin
//                state0_wire_15Cnt = 1'b0;//��������ָʾλ  
//                cur_cnt_value_reg0[15:0] = 0;  
//                keep_on_cnt_reg0 = 1;          
//            end
//        else//Pulse0 == 1'b1 
//            begin
//                if(function_reg0[0]==1'b1 && keep_on_cnt_reg0==1'b1)//����һ������ ���ҵ�ǰ�Ǽ���ģʽ
//                begin
//                    if( cur_cnt_value_reg0[15:0] < target_counter_reg0[15:0] )
//                        begin
//                            cur_cnt_value_reg0 = cur_cnt_value_reg0 + 1; //ÿ��һ������ ��������
//                            state0_wire_15Cnt = 1'b1;    //������״̬λ��ֵ1
//                            state0_wire_1 = 0; //����δ��
//                        end
//                    else
//                        begin
//                            cur_cnt_value_reg0 = 0;
//                            if(timer0_read==1'b0)//�����ǰû�ж����Ĵ���
//                                state0_wire_1 = 1; //������
//                            else 
//                                state0_wire_1 = 0;

//                            if(function_reg0[1] == 1'b0)//�жϵ�ǰ�Ƿ���ѭ��ģʽ
//                                begin
//                                    keep_on_cnt_reg0 = 0;
//                                    state0_wire_15Cnt = 1'b0;//һ��ѭ������ û���´�ѭ�� �趨����״̬��Ϊ0
//                                end
//                            else
//                                begin
//                                    keep_on_cnt_reg0 = 1;
//                                    state0_wire_15Cnt = 1'b1;//һ��ѭ������ �����´�ѭ�� �趨����״̬Ϊ1
//                                end
//                        end
//                end
//            end
//     end

    
//    always @(posedge Clk or negedge Reset)//��ʱ��0 ��ʱ����
//    begin
//        if(Reset == 1'b0)
//            begin
//                Cout0 = 1;//������ʱ��ȱʡ���Ϊ�ߵ�ƽ �����ֶ�ʱ�ж�ʱ�͵�ƽ
//                state0_wire_15Timer = 1'b0;//��������ָʾλ
//                state0_wire_0 = 1'b0;//��ʱ��ָʾλ
//                run_one_period0 = 1;
//                cur_value_reg0[15:0]=0;
//            end
//        else if(refresh_reg0 ==  1'b1)//ˢ�µ�ǰ��ʱ����ֵ
//            begin
//                cur_value_reg0[15:0]=target_counter_reg0[15:0];
//                run_one_period0 = 1;
//            end
//        else
//            begin
//                if(function_reg0[0]==1'b0 && run_one_period0==1'b1) //��ʽ�Ĵ���0��ʾ��ʱ 1��ʾ����
//                    begin
//                        //��ʱ��ģʽ  ��������һһֱ��1 Ȼ������״̬λΪ1 cout���һ���͵�ƽ����
//                        if(cur_value_reg0[15:0]>16'd1)
//                            begin
//                                Cout0 = 1;
//                                cur_value_reg0[15:0] = cur_value_reg0[15:0] - 1;
//                                state0_wire_15Timer = 1'b1;//���λΪ1 ��ʾ���ڼ������߶�ʱ
//                            end
//                        else if(cur_value_reg0[15:0] == 16'd1)
//                            begin
//                                Cout0 = 0;//���һ���͵�ƽ
//                                cur_value_reg0[15:0] = cur_value_reg0[15:0] - 1;
//                                if(timer0_read==1'b0)//�����ǰû�ж����Ĵ���
//                                    state0_wire_0 = 1'b1;//���λ����Ϊ1 ��ʾ��ʱ��
//                                else 
//                                    state0_wire_0 = 1'b0;
//                            end
//                        else
//                            begin
//                                Cout0 = 1;
//                                cur_value_reg0[15:0] = target_counter_reg0[15:0];//����ֵ�Ĵ�����ֵ����ǰֵ�Ĵ���
//                                //state0_wire_0 = 1'b0;//����0bitΪ1 ��ʾ��һ�μ������
//                                if(function_reg0[1]==1'b0)
//                                    run_one_period0 = 1'b0;//ֻ����һ�ξ�ֹͣ
//                                else
//                                    run_one_period0 = 1'b1;//����ѭ������
//                            end
//                    end
//                 else if(run_one_period0 == 1'b0)//run_one_period0 == 0 ��ʾ����������
//                    begin
//                        state0_wire_15Timer = 1'b0;//��ʾĿǰ��������
//                    end
//            end
//    end

//    always @(posedge Pulse1 or negedge Reset)//��ʱ��1����ģʽ
//    begin
//        if(Reset == 1'b0)
//            begin
//                state1_wire_15Cnt = 1'b0;//��������ָʾλ  
//                cur_cnt_value_reg1[15:0] = 0;  
//                keep_on_cnt_reg1 = 1;        
//            end
//        else//Pulse0 == 1'b1 
//            begin
//                if(function_reg1[0]==1'b1 && keep_on_cnt_reg1==1'b1)//����һ������ ���ҵ�ǰ�Ǽ���ģʽ
//                begin
//                    if( cur_cnt_value_reg1[15:0] < target_counter_reg1[15:0] )
//                        begin
//                            cur_cnt_value_reg1 = cur_cnt_value_reg1 + 1; //ÿ��һ������ ��������
//                            state1_wire_15Cnt = 1'b1;    //������״̬λ��ֵ1
//                            state1_wire_1 = 0; //����δ��
//                        end
//                    else
//                        begin
//                            cur_cnt_value_reg1 = 0;
//                            if(timer1_read == 1'b0)
//                                state1_wire_1 = 1; //������
//                            else
//                                state1_wire_1 = 0;

//                            if(function_reg1[1] == 1'b0)//�жϵ�ǰ�Ƿ���ѭ��ģʽ
//                                begin
//                                    keep_on_cnt_reg1 = 0;
//                                    state1_wire_15Cnt = 1'b0;//һ��ѭ������ û���´�ѭ�� �趨����״̬��Ϊ0
//                                end
//                            else
//                                begin
//                                    keep_on_cnt_reg1 = 1;
//                                    state1_wire_15Cnt = 1'b1;//һ��ѭ������ �����´�ѭ�� �趨����״̬Ϊ1
//                                end
//                        end
//                end
//            end
//     end

    
//    always @(posedge Clk or negedge Reset)//��ʱ��1 ��ʱ����
//    begin
//        if(Reset == 1'b0)
//            begin
//                Cout1 = 1;//������ʱ��ȱʡ���Ϊ�ߵ�ƽ �����ֶ�ʱ�ж�ʱ�͵�ƽ
//                state1_wire_15Timer = 1'b0;//��������ָʾλ
//                state1_wire_0 = 1'b0;//��ʱ��ָʾλ
//                run_one_period1 = 1;
//                cur_value_reg1[15:0]=0;
//            end
//        else if(refresh_reg1 ==  1'b1)//ˢ�µ�ǰ��ʱ����ֵ
//            begin
//                cur_value_reg1[15:0]=target_counter_reg1[15:0];
//                run_one_period1 = 1;
//            end
//        else
//            begin
//                if(function_reg1[0]==1'b0 && run_one_period1==1'b1) //��ʽ�Ĵ���0��ʾ��ʱ 1��ʾ����
//                    begin
//                        //��ʱ��ģʽ  ��������һһֱ��1 Ȼ������״̬λΪ1 cout���һ���͵�ƽ����
//                        if(cur_value_reg1[15:0]>16'd1)
//                            begin
//                                Cout1 = 1;
//                                cur_value_reg1[15:0] = cur_value_reg1[15:0] - 1;
//                                state1_wire_15Timer = 1'b1;//���λΪ1 ��ʾ���ڼ������߶�ʱ
//                            end
//                        else if(cur_value_reg1[15:0] == 16'd1)
//                            begin
//                                Cout1 = 0;//���һ���͵�ƽ
//                                cur_value_reg1[15:0] = cur_value_reg1[15:0] - 1;
//                                if(timer1_read==1'b0)   
//                                    state1_wire_0 = 1'b1;//���λ����Ϊ1 ��ʾ��ʱ��
//                                else 
//                                    state1_wire_0 = 1'b0;
//                            end
//                        else
//                            begin
//                                Cout1 = 1;
//                                cur_value_reg1[15:0] = target_counter_reg1[15:0];//����ֵ�Ĵ�����ֵ����ǰֵ�Ĵ���
//                                //state0_wire_0 = 1'b0;//����0bitΪ1 ��ʾ��һ�μ������
//                                if(function_reg1[1]==1'b0)
//                                    run_one_period1 = 1'b0;//ֻ����һ�ξ�ֹͣ
//                                else
//                                    run_one_period1 = 1'b1;//����ѭ������
//                            end
//                    end
//                 else if(run_one_period1 == 1'b0)//run_one_period0 == 0 ��ʾ����������
//                    begin
//                        state1_wire_15Timer = 1'b0;//��ʾĿǰ��������
//                    end
//            end
//    end



//endmodule
