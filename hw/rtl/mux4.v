module mux4 #( 
  parameter WIDTH= 8 
  ) ( 
  input  [WIDTH-1:0] din1, din2, din3, din4, 
  input  [1:0]       select, 
  output [WIDTH-1:0] dout 
);

// your code

assign dout= (select == 2'b00) ?  din1 :  (select == 2'b01) ?  din2 : (select == 2'b10) ?  din3 :  din4;
	

endmodule
