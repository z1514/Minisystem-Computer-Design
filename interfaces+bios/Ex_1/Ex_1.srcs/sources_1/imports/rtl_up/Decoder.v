//module Decoder (
//        input A,
//        input B,
//        input C,
//        input G1,
//        input G2AN,
//        input G2BN,
//        output Y0N,
//        output Y1N,
//        output Y2N,
//        output Y3N,
//        output Y4N,
//        output Y5N,
//        output Y6N,
//        output Y7N
//        );
//        integer i;
//        reg [7:0] YN;
//        wire[2:0] cba,G;
//        assign cba = {C,B,A};
//        assign G = {G1,G2AN,G2BN};
//        assign Y0N = YN[0];
//        assign Y1N = YN[1];
//        assign Y2N = YN[2];
//         assign Y3N = YN[3];
//          assign Y4N = YN[4];
//          assign Y5N = YN[5];
//            assign Y6N = YN[6];
//           assign Y7N = YN[7];
//        always @(*)
//         begin
//               YN=8'b11111111;
//                  if(G[2]&(!G[1])&(!G[0])) begin
//                      case(cba)
//                          3'b000:YN[0]=0;
//                          3'b001:YN[1]=0;
//                          3'b010:YN[2]=0;
//                          3'b011:YN[3]=0;
//                          3'b100:YN[4]=0;
//                          3'b101:YN[5]=0;
//                          3'b110:YN[6]=0;
//                          3'b111:YN[7]=0;
//                      endcase
//                  end
//               end
      
////        begin
////        for(i = 0; i < 8; i=i+1)
////                        YN[i] = 1;
////                    begin
////                        YN[4*cba[2] + 2*cba[1] + cba[0]] = 0;
////          end

////        if(G==3'b100)
////        begin 
////        if (cba==3'b000)
////            YN=2'hfe;
////           if(cba==3'b001)
////           YN=2'hfd;
////           if(cba==3'b010)
////           YN=2'hfb;
////           if(cba==3'b011)
////           YN=2'hf7;
////           if(cba==3'b100)
////           YN=2'hef;
////           if(cba==3'b101)
////           YN=2'hdf;
////           if(cba==3'b110)
////           YN=2'hbf;
////            if(cba==3'b111)
////             YN=2'h7f;
////           end//end if 
////           else
////           begin 
////           YN=2'h00;
////           end //end else
//           //end//end always     
//endmodule