module AMCAL3_8bit_LOD ( ain , bin , a , b , ashift , bshift ) ; 
 
	input [8:1] ain , bin ;
	output [3:1] a , b ;
	output [3:1] ashift , bshift;
	
	wire [4:1] adetect , bdetect ;
	wire [8:1] adet , bdet ;
	wire [6:1] aa , bb;
	wire [2:1] aaa , bbb;


 
	assign adetect [4] = ( ain [8] | ain [7] ) ;
	assign adetect [3] = ( ain [6] | ain [5] ) ;
	assign adetect [2] = ( ain [4] | ain [3] ) ;
	assign adetect [1] = ( ain [2] | ain [1] ) ;
	
	assign adet = 	 ( adetect [4] == 1'b1 ) ? { ain [8:3] , 2'd3 }:
					 ( adetect [3] == 1'b1 ) ? { ain [6:1] , 2'd2 }:
					 ( adetect [2] == 1'b1 ) ? { ain [4:1] , 2'b0 , 2'd1 }:
					 ( adetect [1] == 1'b1 ) ? { ain [2:1] , 4'b0 , 2'd0 }:8'b0 ;
 
	assign aa =		 ( adet [8] == 1'b1 ) ? { adet [8:4] , 1'd1 }:
					 ( adet [7] == 1'b1 ) ? { adet [7:3] , 1'd0 }:6'b0 ;
					
	assign a = aa [6:4] ;
	assign aaa = aa [3:2] ;

 
	assign bdetect [4] = ( bin [8] | bin [7] ) ;
	assign bdetect [3] = ( bin [6] | bin [5] ) ;
	assign bdetect [2] = ( bin [4] | bin [3] ) ;
	assign bdetect [1] = ( bin [2] | bin [1] ) ;
	
	assign bdet = 	 ( bdetect [4] == 1'b1 ) ? { bin [8:3] , 2'd3 }:
					 ( bdetect [3] == 1'b1 ) ? { bin [6:1] , 2'd2 }:
					 ( bdetect [2] == 1'b1 ) ? { bin [4:1] , 2'b0 , 2'd1 }:
					 ( bdetect [1] == 1'b1 ) ? { bin [2:1] , 4'b0 , 2'd0 }:8'b0 ;
 
	assign bb =		 ( bdet [8] == 1'b1 ) ? { bdet [8:4] , 1'd1 }:
					 ( bdet [7] == 1'b1 ) ? { bdet [7:3] , 1'd0 }:6'b0 ;
					
	assign b = bb [6:4] ;
	assign bbb = bb [3:2] ;

	assign ashift = { adet [2:1] , aa [1] } ; 
	assign bshift = { bdet [2:1] , bb [1] } ; 		 
	
 
endmodule