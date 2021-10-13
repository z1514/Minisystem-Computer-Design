`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/07 21:30:04
// Design Name: 
// Module Name: access_datamemory_sim
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


module access_datamemory_sim();
    //input
    reg clock=1;
    reg reset;
    
    reg [1:0] Mem_read_type_in;
    reg Mem_read_extend_in;
    reg [1:0] Mem_write_type_in;
    reg Mem_write_en_in;
    
    reg [31:0] Write_data;
    reg [31:0] Mem_address;
    
    //output
    wire [31:0] Read_data;
    
    access_datamemory uut(
        clock,
        reset,
        Mem_read_type_in,
        Mem_read_extend_in,
        Mem_write_type_in,
        Mem_write_en_in,
        Write_data,
        Mem_address,
        
        Read_data
    );
    
    always #2 clock=~clock;
    
    initial fork
        //write_test
        #0 Mem_write_type_in=2'b11;
        #0 Mem_write_en_in=1'b0;
        #0 Write_data=32'h1122_3344;
        #0 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;
        #0 Mem_read_type_in=2'b11;     
             
        #4 Mem_write_type_in=2'b01;
        #4 Mem_write_en_in=1'b1;
        #4 Write_data=32'h1122_3344;//44
        #4 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;             
             
        #8 Mem_write_type_in=2'b01;
        #8 Mem_write_en_in=1'b1;
        #8 Write_data=32'h1122_3344;//44
        #8 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0001; 
        
        #12 Mem_write_type_in=2'b01;
        #12 Mem_write_en_in=1'b1;
        #12 Write_data=32'h1122_3344;//44
        #12 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;   
        
        #16 Mem_write_type_in=2'b01;
        #16 Mem_write_en_in=1'b1;
        #16 Write_data=32'h1122_3344;//44
        #16 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0011;   
        
        #20 Mem_write_type_in=2'b10;
        #20 Mem_write_en_in=1'b1;
        #20 Write_data=32'h5566_7788;//7788
        #20 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;                                          
             
        #24 Mem_write_type_in=2'b10;
        #24 Mem_write_en_in=1'b1;
        #24 Write_data=32'h5566_7788;//7788
        #24 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;   
        
        #28 Mem_write_type_in=2'b11;
        #28 Mem_write_en_in=1'b1;
        #28 Write_data=32'h99AA_BB11;//99AA_BBCC
        #28 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;                      
                
        //read test
        #32 Mem_read_type_in=2'b01;
        #32 Mem_read_extend_in=0;
        #32 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC
        
        #36 Mem_read_type_in=2'b01;
        #36 Mem_read_extend_in=1;
        #36 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC 
        
        #40 Mem_read_type_in=2'b01;
        #40 Mem_read_extend_in=0;
        #40 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0001;//99AA_BBCC 
        
        #44 Mem_read_type_in=2'b01;
        #44 Mem_read_extend_in=1;
        #44 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0001;//99AA_BBCC      
        
        #48 Mem_read_type_in=2'b01;
        #48 Mem_read_extend_in=0;
        #48 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;//99AA_BBCC 
        
        #52 Mem_read_type_in=2'b01;
        #52 Mem_read_extend_in=1;
        #52 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;//99AA_BBCC    
        
        #56 Mem_read_type_in=2'b01;
        #56 Mem_read_extend_in=0;
        #56 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0011;//99AA_BBCC 
        
        #60 Mem_read_type_in=2'b01;
        #60 Mem_read_extend_in=1;
        #60 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0011;//99AA_BBCC 
        
        #64 Mem_read_type_in=2'b10;
        #64 Mem_read_extend_in=0;
        #64 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC 
        
        #68 Mem_read_type_in=2'b10;
        #68 Mem_read_extend_in=1;
        #68 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC  
        
        #72 Mem_read_type_in=2'b10;
        #72 Mem_read_extend_in=0;
        #72 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;//99AA_BBCC 
        
        #76 Mem_read_type_in=2'b10;
        #76 Mem_read_extend_in=1;
        #76 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0010;//99AA_BBCC  
        
        #80 Mem_read_type_in=2'b11;
        #80 Mem_read_extend_in=0;
        #80 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC 
        
        #84 Mem_read_type_in=2'b11;
        #84 Mem_read_extend_in=1;
        #84 Mem_address=32'b0000_0000_0000_0000_1000_0000_0000_0000;//99AA_BBCC                                                       
    join
    
endmodule
