
  	                                            		
module Comparator2(
   input[1:0] a, b, output reg Equals);      		
                   	          	
// student code here
wire n0, n1, Out;
xnor xnor0 (n0,a[0],b[0]);
xnor xnor1 (n1,a[1],b[1]);

and and0 (Out,n0,n1);

assign Equals = Out;

endmodule // Comparator2 




    