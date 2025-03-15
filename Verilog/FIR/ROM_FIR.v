module ROM_FIR #(parameter bits_I = 3, bits_A=16)(
	
	input [bits_I-1:0]I,				//direcciones
	output reg signed [bits_A-1:0]A     //Selecciona valor para A
	
	); 
	
	always @(*)
		
		case (I)
			6'b000001: A = 16'b0000000000000000; 	//a5
			
			6'b000010: A = 16'b0000000000000001; 	//a4
			
			6'b000011: A = 16'b0000000000000111;	//a3
			
			6'b000100: A = 16'b0000000000000111; 	//a2
			
			6'b000101: A = 16'b0000000000000001; 	//a1
			
			6'b000110: A = 16'b0000000000000000;	//a0 
			
			default A=0;	
			
	   endcase
endmodule