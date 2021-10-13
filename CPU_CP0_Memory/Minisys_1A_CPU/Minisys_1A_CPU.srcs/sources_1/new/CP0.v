`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 00:48:32
// Design Name: 
// Module Name: CP0
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


module CP0(
    //input
    clock,
    reset,
    
    Mfc0_in,
    Mtc0_in,
    Sel_in,
    RD_address_in,
    RT_data_in,
    
    Break_in,
    Syscall_in,
    
    External_interrupt,
 
    //Internal exception
    OF,
    CF,
    ER,
    Ins_invalid,
    Access_error_in,
    
    PC_plus_4_in, 
    
    Eret_in,
    
    
    //output
    Interrupt_respond,
    RT_data_out,
    PC_out,
    PC_CP0_en_out,
    Access_error_out,
    clear,
    
    //test
    EPC
    );
    
    //input
    input clock,reset;
    input Mfc0_in,Mtc0_in;
    input [2:0] Sel_in;
    input [4:0] RD_address_in;
    input [31:0] RT_data_in;
    input Break_in,Syscall_in,Eret_in;
    input [5:0] External_interrupt;
    input OF,CF,ER,Ins_invalid,Access_error_in;
    input [31:0] PC_plus_4_in;
    
    //output
    output reg [31:0] RT_data_out,PC_out;
    output reg Access_error_out,clear,PC_CP0_en_out;
    output reg [5:0] Interrupt_respond;//output to interface
    
    //test
    output reg [31:0] EPC;
    
    //reg
    reg [31:0] CP0_regs [31:0];
    //when reseting,they need initial data.
    //#12 Status
    //#13 Cause  
    //#14 EPC
    
    always @(negedge clock) begin
        clear=0;
        Interrupt_respond=6'b0;//0-accepted,1-ignored
        PC_CP0_en_out=0;
        Access_error_out=0;
        if(reset==1) begin
            CP0_regs[12]=32'b0000_0000_0000_0000_1111_1100_0001_0001;
            CP0_regs[13]=32'b0000_0000_0000_0000_0000_0000_0111_1100;
            CP0_regs[14]=32'b0;
        end
        if(Mfc0_in==1) begin
            if(CP0_regs[12][4:3]==2'b00) begin //core status
                RT_data_out=CP0_regs[RD_address_in];
                Access_error_out=0;
            end else begin //user status
                Access_error_out=1;
            end   
        end
        if(Mtc0_in==1) begin
            if(CP0_regs[12][4:3]==2'b00) begin //core status
                CP0_regs[RD_address_in]=RT_data_in;
                Access_error_out=0;
            end else begin //user status
                Access_error_out=1;
            end 
        end
        if(Eret_in==1) begin
            if(CP0_regs[12][4:3]==2'b00) begin
                CP0_regs[12][4:3]=2'b10;
                CP0_regs[12][0]=1'b1;
                PC_out=CP0_regs[14]; 
                PC_CP0_en_out=1;
                clear=1;
            end        
        end
        if(Syscall_in==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01000;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end              
        end else if(Break_in==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01001;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end
        end else if(Ins_invalid==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01010;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end                
        end else if(OF==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01100;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end             
        end else if(CF==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01101;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end          
        end else if(ER==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01110;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end     
        end else if(Access_error_in==1) begin
            if(CP0_regs[12][0]==1) begin
                CP0_regs[12][0]=1'b0;
                CP0_regs[12][4:3]=2'b00;
                CP0_regs[13][6:2]=5'b01111;
                CP0_regs[14]=PC_plus_4_in;
                PC_out=32'hec;//待定
                PC_CP0_en_out=1;
                clear=1;
            end        
        //external interrupt    
        end else if(CP0_regs[13][13]==1) begin
            if(CP0_regs[12][15]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;
                    CP0_regs[13][13]=1'b0;
                    CP0_regs[13][6:2]=5'b00110;
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;
                end
            end
        end else if(External_interrupt[5]==1) begin
            if(CP0_regs[12][15]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;  
                    CP0_regs[13][6:2]=5'b00110;    
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;                                  
                end else begin
                    if(CP0_regs[13][13]==1) begin
                        Interrupt_respond[5]=1;
                    end else begin
                        CP0_regs[13][13]=1;
                    end
                end
            end
        end else if(CP0_regs[13][12]==1) begin
            if(CP0_regs[12][14]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;
                    CP0_regs[13][12]=1'b0;
                    CP0_regs[13][6:2]=5'b00101;
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;
                end        
            end
        end else if(External_interrupt[4]==1) begin
            if(CP0_regs[12][14]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;  
                    CP0_regs[13][6:2]=5'b00101;    
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;                                  
                end else begin
                    if(CP0_regs[13][12]==1) begin
                        Interrupt_respond[4]=1;
                    end else begin
                        CP0_regs[13][12]=1;
                    end
                end        
            end
        end else if(CP0_regs[13][11]==1) begin
            if(CP0_regs[12][13]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;
                    CP0_regs[13][11]=1'b0;
                    CP0_regs[13][6:2]=5'b00100;
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;
                end        
            end
        end else if(External_interrupt[3]==1) begin
            if(CP0_regs[12][13]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;  
                    CP0_regs[13][6:2]=5'b00100;    
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;                                  
                end else begin
                    if(CP0_regs[13][11]==1) begin
                        Interrupt_respond[3]=1;
                    end else begin
                        CP0_regs[13][11]=1;
                    end
                end        
            end
        end else if(CP0_regs[13][10]==1) begin
            if(CP0_regs[12][12]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;
                    CP0_regs[13][10]=1'b0;
                    CP0_regs[13][6:2]=5'b00011;
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;
                end        
            end        
        end else if(External_interrupt[2]==1) begin
            if(CP0_regs[12][12]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;  
                    CP0_regs[13][6:2]=5'b00011;    
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;                                  
                end else begin
                    if(CP0_regs[13][10]==1) begin
                        Interrupt_respond[2]=1;
                    end else begin
                        CP0_regs[13][10]=1;
                    end
                end    
            end  
        end else if(CP0_regs[13][9]==1) begin
            if(CP0_regs[12][11]==1) begin
                if(CP0_regs[12][0]==1) begin
                   CP0_regs[12][0]=1'b0;
                   CP0_regs[12][4:3]=2'b00;
                   CP0_regs[13][9]=1'b0;
                   CP0_regs[13][6:2]=5'b00010;
                   CP0_regs[14]=PC_plus_4_in;
                   PC_out=32'hec;//待定
                   PC_CP0_en_out=1;
                   clear=1;
               end    
            end  
        end else if(External_interrupt[1]==1) begin
            if(CP0_regs[12][11]==1) begin
                if(CP0_regs[12][0]==1) begin
                   CP0_regs[12][0]=1'b0;
                   CP0_regs[12][4:3]=2'b00;  
                   CP0_regs[13][6:2]=5'b00010;    
                   CP0_regs[14]=PC_plus_4_in;
                   PC_out=32'hec;//待定
                   PC_CP0_en_out=1;
                   clear=1;                                  
               end else begin
                   if(CP0_regs[13][9]==1) begin
                       Interrupt_respond[1]=1;
                   end else begin
                       CP0_regs[13][9]=1;
                   end
               end    
            end       
        end else if(CP0_regs[13][8]==1) begin
            if(CP0_regs[12][10]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;
                    CP0_regs[13][8]=1'b0;
                    CP0_regs[13][6:2]=5'b00001;
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;
                end    
            end  
        end else if(External_interrupt[0]==1) begin
            if(CP0_regs[12][10]==1) begin
                if(CP0_regs[12][0]==1) begin
                    CP0_regs[12][0]=1'b0;
                    CP0_regs[12][4:3]=2'b00;  
                    CP0_regs[13][6:2]=5'b00001;    
                    CP0_regs[14]=PC_plus_4_in;
                    PC_out=32'hec;//待定
                    PC_CP0_en_out=1;
                    clear=1;                                  
                end else begin
                    if(CP0_regs[13][8]==1) begin
                        Interrupt_respond[0]=1;
                    end else begin
                        CP0_regs[13][8]=1;
                    end
                end    
            end                                                                                                                            
        end
        EPC=CP0_regs[14];
    end
endmodule
