module AMCAL3_32bit_LOD ( ain , bin , a , b , ashift , bshift ) ; 
 
	input [32:1] ain , bin ;
	output [3:1] a , b ;
	output [5:1] ashift , bshift;
	
	wire [4:1] adetect , bdetect ;
	wire [14:1] adet , bdet ;
	wire [8:1] aa , bb;
	wire [2:1] aaa , bbb;
 
	assign adetect [4] = ( ain [32] | ain [31] | ain [30] | ain [29] | ain [28] | ain [27] | ain [26] | ain [25] ) ;
	assign adetect [3] = ( ain [24] | ain [23] | ain [22] | ain [21] | ain [20] | ain [19] | ain [18] | ain [17] ) ;
	assign adetect [2] = ( ain [16] | ain [15] | ain [14] | ain [13] | ain [12] | ain [11] | ain [10] | ain [9] ) ;
	assign adetect [1] = ( ain [8] | ain [7] | ain [6] | ain [5] | ain [4] | ain [3] | ain [2] | ain [1] ) ;
	
	assign adet = 	 ( adetect [4] == 1'b1 ) ? { ain [32:21] , 2'd3 }:
					 ( adetect [3] == 1'b1 ) ? { ain [24:13] , 2'd2 }:
					 ( adetect [2] == 1'b1 ) ? { ain [16:5] , 2'd1 }:
					 ( adetect [1] == 1'b1 ) ? { ain [8:1] , 4'd0 , 2'd0 }:14'b0 ;
 
	assign aa =		 ( adet [14] == 1'b1 ) ? { adet [14:10] , 3'd7 }:
					 ( adet [13] == 1'b1 ) ? { adet [13:9] , 3'd6 }:
					 ( adet [12] == 1'b1 ) ? { adet [12:8] , 3'd5 }:
					 ( adet [11] == 1'b1 ) ? { adet [11:7] , 3'd4 }:
					 ( adet [10] == 1'b1 ) ? { adet [10:6] , 3'd3 }:
					 ( adet [9] == 1'b1 ) ? { adet [9:5] , 3'd2 }:
					 ( adet [8] == 1'b1 ) ? { adet [8:4] , 3'd1 }:
					 ( adet [7] == 1'b1 ) ? { adet [7:3] , 3'd0 }:8'b0 ;
					
	assign a = aa [8:6] ;
	assign aaa = aa [5:4] ;

 
	assign bdetect [4] = ( bin [32] | bin [31] | bin [30] | bin [29] | bin [28] | bin [27] | bin [26] | bin [25] ) ;
	assign bdetect [3] = ( bin [24] | bin [23] | bin [22] | bin [21] | bin [20] | bin [19] | bin [18] | bin [17] ) ;
	assign bdetect [2] = ( bin [16] | bin [15] | bin [14] | bin [13] | bin [12] | bin [11] | bin [10] | bin [9] ) ;
	assign bdetect [1] = ( bin [8] | bin [7] | bin [6] | bin [5] | bin [4] | bin [3] | bin [2] | bin [1] ) ;

	assign bdet = 	 ( bdetect [4] == 1'b1 ) ? { bin [32:21] , 2'd3 }:
					 ( bdetect [3] == 1'b1 ) ? { bin [24:13] , 2'd2 }:
					 ( bdetect [2] == 1'b1 ) ? { bin [16:5] , 2'd1 }:
					 ( bdetect [1] == 1'b1 ) ? { bin [8:1] , 4'd0 , 2'd0 }:14'b0 ;
 
	assign bb = 	 ( bdet [14] == 1'b1 ) ? { bdet [14:10] , 3'd7 }:
					 ( bdet [13] == 1'b1 ) ? { bdet [13:9] , 3'd6 }:
					 ( bdet [12] == 1'b1 ) ? { bdet [12:8] , 3'd5 }:
					 ( bdet [11] == 1'b1 ) ? { bdet [11:7] , 3'd4 }:
					 ( bdet [10] == 1'b1 ) ? { bdet [10:6] , 3'd3 }:
					 ( bdet [9] == 1'b1 ) ? { bdet [9:5] , 3'd2 }:
					 ( bdet [8] == 1'b1 ) ? { bdet [8:4] , 3'd1 }:
					 ( bdet [7] == 1'b1 ) ? { bdet [7:3] , 3'd0 }:8'b0 ;
			
	assign b = bb [8:6] ;
	assign bbb = bb [5:4] ;
 
					
	assign ashift = { adet [2:1] , aa [3:1] } ; 
	assign bshift = { bdet [2:1] , bb [3:1] } ; 		 
		 
endmodule