
  	                                            		
module Comparator2(
   input[1:0] A, B,
   output reg Equals
);      		
                   	          	
// student code here
always @(A,B) begin
    if ((A[1]~^B[1])&&(A[0]~^B[0])) Equals <= 1'b1;
    else Equals <= 1'b0;
end
endmodule // Comparator2 
