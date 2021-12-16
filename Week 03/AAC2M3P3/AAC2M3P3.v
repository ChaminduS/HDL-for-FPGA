module find_errors   (                        // line 1
  input  [3:0]a,                             // line 2
  output [3:0]b,                             // line 3
  input [5:0]c );                            // line 4
                                             // line 5
  wire [3:0]aw;                             // line 6
  wire [5:0]creg;                          // line 7
  reg [3:0]bw     ;                       // line 8
                                       // line 9
  assign aw = a;                             // line 10
  assign b = bw;                             // line 11
  assign creg = c;                           // line 12
always@(aw,creg)                                      // line 13 
  begin                                      // line 14
    if (creg == 6'b111111)   //creg is all 1s     // line 15 
       bw <= aw;                             // line 16  
    else                                     // line 17
     bw <= 4'b0101;                           // line 18   
    end                                   // line 19
                                 // line 20  
endmodule  