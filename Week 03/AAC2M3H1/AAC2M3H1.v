////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//               Application Assignment Problem 5 Module 3 Course 2           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
//
// 
// @file AAC2M3H1.v
// @brief Application Assignment 2-007 4-bit full adder
// @version: 1.0 
// Date of current revision:  @date 2019-07-01  
// Target FPGA: [Intel Altera MAX10] 
// Tools used: [Quartus Prime 16.1 or Sigasi] for editing and/or synthesis 
//             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
//             [Quartus Prime 16.1]  for place and route if applied
//             
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of 4-bit adder with carry. The inputs are 2 
//               3-bit vectors A and B, and a scalar carry in Cin.  Outputs are
//               Sum and Cout.  
//
//  Hierarchy:  There is only one level in this simple design.
//        
//  Designed by:  @author [your name] 
//                [Organization]
//                [email] 
//
//      Copyright (c) 2019 by Tim Scherr
//
// Redistribution, modification or use of this software in source or binary
// forms is permitted as long as the files maintain this copyright. Users are
// permitted to modify this and use it to learn about the field of HDl code.
// Tim Scherr and the University of Colorado are not liable for any misuse
// of this material.
//////////////////////////////////////////////////////////////////////////////
// 
  	                                            		
module FullAdd1 (a,b,cin,sum,cout);
    input a,b,cin;
    output sum, cout;

    wire n0,n1,n2;

    xor xor0(n0,a,b);
    xor xor1(Sum,n0,Cin);
    and and0(n1,Cin,n0);
    and and1(n2,a,b);
    or or0(Cout,n1,n2);
endmodule


module FullAdd4( A,B,Cin,Sum,Cout);                	
    input [3:0] A, B; 
    input Cin; 			
    output [3:0] Sum;
    output Cout;


    wire Sum0,Sum1,Sum2,Sum3,Cout0,Cout1,Cout2;

                   	          	
// student code here
    FullAdd1 f0(.a(A[0]),.b(B[0]),.cin(Cin),.sum(Sum[0]),.cout(Cout0));
    FullAdd1 f1(.a(A[1]),.b(B[1]),.cin(Cout0),.sum(Sum[1]),.cout(Cout1));
    FullAdd1 f2(.a(A[2]),.b(B[2]),.cin(Cout1),.sum(Sum[2]),.cout(Cout2));
    FullAdd1 f3(.a(A[3]),.b(B[3]),.cin(Cout2),.sum(Sum[3]),.cout(Cout));

endmodule // Majority  




    