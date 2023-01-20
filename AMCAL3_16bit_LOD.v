module AMCAL3_16bit_LOD ( ain , bin , a , b , ashift , bshift ) ; 
 
	input [16:1] ain , bin ;
	output [3:1] a , b ;
	output [4:1] ashift , bshift;
	
	wire [4:1] adetect , bdetect ;
	wire [10:1] adet , bdet ;
	wire [7:1] aa , bb;
	wire [2:1] aaa , bbb;

	
	assign adetect [4] = ( ain [16] | ain [15] | ain [14] | ain [13]  ) ;
	assign adetect [3] = ( ain [12] | ain [11] | ain [10] | ain [9]  ) ;
	assign adetect [2] = ( ain [8]  | ain [7]  | ain [6]  | ain [5]  ) ;
	assign adetect [1] = ( ain [4]  | ain [3]  | ain [2]  | ain [1]  ) ;
	
	assign adet = 	 ( adetect [4] == 1'b1 ) ? { ain [16:9] , 2'd3 }:
					 ( adetect [3] == 1'b1 ) ? { ain [12:5] , 2'd2 }:
					 ( adetect [2] == 1'b1 ) ? { ain [8:1] , 2'd1 }:
					 ( adetect [1] == 1'b1 ) ? { ain [4:1]  , 4'd0 , 2'd0 }:10'b0 ;
 
	assign aa =		 ( adet [10] == 1'b1 ) ? { adet [10:6] , 2'd3 }:
					 ( adet [9] == 1'b1 ) ? { adet [9:5] , 2'd2 }:
					 ( adet [8] == 1'b1 ) ? { adet [8:4] , 2'd1 }:
					 ( adet [7] == 1'b1 ) ? { adet [7:3] , 2'd0 }:7'b0 ;
					
	assign a = aa [7:5] ;
	assign aaa = aa [4:3] ;

 
	assign bdetect [4] = ( bin [16] | bin [15] | bin [14] | bin [13]  ) ;
	assign bdetect [3] = ( bin [12] | bin [11] | bin [10] | bin [9]  ) ;
	assign bdetect [2] = ( bin [8]  | bin [7]  | bin [6]  | bin [5]  ) ;
	assign bdetect [1] = ( bin [4]  | bin [3]  | bin [2]  | bin [1]  ) ;
	
	assign bdet = 	 ( bdetect [4] == 1'b1 ) ? { bin [16:9] , 2'd3 }:
					 ( bdetect [3] == 1'b1 ) ? { bin [12:5] , 2'd2 }:
					 ( bdetect [2] == 1'b1 ) ? { bin [8:1] , 2'd1 }:
					 ( bdetect [1] == 1'b1 ) ? { bin [4:1]  , 4'd0 , 2'd0 }:10'b0 ;
 
	assign bb =		 ( bdet [10] == 1'b1 ) ? { bdet [10:6] , 2'd3 }:
					 ( bdet [9] == 1'b1 ) ? { bdet [9:5] , 2'd2 }:
					 ( bdet [8] == 1'b1 ) ? { bdet [8:4] , 2'd1 }:
					 ( bdet [7] == 1'b1 ) ? { bdet [7:3] , 2'd0 }:7'b0 ;
					
	assign b = bb [7:5] ;
	assign bbb = bb [4:3] ;
		
	 					
	assign ashift = { adet [2:1] , aa [2:1] } ; 
	assign bshift = { bdet [2:1] , bb [2:1] } ; 		 
		
endmodule