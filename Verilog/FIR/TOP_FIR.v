module TOP_FIR #(parameter bits_X = 16, bits_I = 3, bits_P = 60, bits_N = 3, bits_S = 6, bits_Y = 16)(
	
	input clk,
	input rst,
	input[bits_N-1:0] N,			//Número de iteraciones
	input STM,			    		//Habilita MAC 
	input [bits_S-1:0]S,			//Ajuste	
	
	output[bits_Y-1:0] Y,			//Muestra de salida
	output RDY		   				//Termina MAC
	);
	
	wire [bits_X-1:0] DATTA;		//Dato de entrada
	wire LDX;			  			//Actualiza registros	
	wire [bits_X-1:0] out_regis1;   //Salida de registro 1 hacía MUX
	wire [bits_X-1:0] out_regis2;   //Salida de registro 2 hacía MUX
	wire [bits_X-1:0] out_regis3;   //Salida de registro 3 hacía MUX
	wire [bits_X-1:0] out_regis4;   //Salida de registro 4 hacía MUX
	wire [bits_X-1:0] out_regis5;   //Salida de registro 5 hacía MUX
	wire signed [bits_X-1:0] X;		//Salida de MUX hacía MAC
	wire [bits_I-1:0] I;			//Salida de MAC hacía selector de MUX y ROM
	wire [bits_X-1:0] A;			//Salida de ROM hacía MAC, dato de coeficiente
	wire RDY_WIRE;	   				//Termina MAC, habilita transferencia
	
	assign RDY=RDY_WIRE;
	
	
	//**********************Instanciando ROM de la señal**************************
	
	ROM_signal U0( 
	
	.LDX(LDX), 
    .DATTA(DATTA)
	);
	
	//**********************Instanciando registros**********************************
	
	REG_FIR #(.bits_X(bits_X)) U1(
		.clk(clk),
		.rst(rst),
		.STM(STM),
		.LDX(LDX),				   		
		.DATTA(DATTA),			
		.out_regis(out_regis1)
		);
		
	REG_FIR #(.bits_X(bits_X)) U2( 
		.clk(clk),
		.rst(rst),
		.STM(STM),
		.LDX(LDX),				   		
		.DATTA(out_regis1),			
		.out_regis(out_regis2)
		);
	
	REG_FIR #(.bits_X(bits_X)) U3(
		.clk(clk),
		.rst(rst),
		.STM(STM),
		.LDX(LDX),				   		
		.DATTA(out_regis2),			
		.out_regis(out_regis3)
		);
		
	REG_FIR #(.bits_X(bits_X)) U4(
		.clk(clk),
		.rst(rst),
		.STM(STM),
		.LDX(LDX),				   		
		.DATTA(out_regis3),			
		.out_regis(out_regis4)
		);
		
	REG_FIR #(.bits_X(bits_X)) U5(
		.clk(clk),
		.rst(rst),
		.STM(STM),
		.LDX(LDX),				   		
		.DATTA(out_regis4),			
		.out_regis(out_regis5)
		);
	
	//**********************************instanciando MUX************************
	
	
	MUX_FIR #(.bits_I(bits_I), .bits_X(bits_X)) U6(
		.I(I),	
		.DATTA(DATTA),
		.REG1(out_regis1),	
		.REG2(out_regis2),	
		.REG3(out_regis3),	
		.REG4(out_regis4),	
		.REG5(out_regis5),	
		.X(X)
		);
		
	//***********************************Instanciando ROM************************
	
	ROM_FIR #(.bits_I(bits_I), .bits_A(bits_X)) U7(
		.I(I),
		.A(A)
		);
		
	//*******************************Instanciando transferencia***************
	
	Transferencia_FIR U8(
		.clk(clk),    
		.rst(rst),    
		.RDY(RDY_WIRE),    
		.LDX(LDX)
		);
		
	//******************************Instanciando MAC***********************
	
	TOP_MAC #(.bits_X(bits_X), .bits_A(bits_X), .bits_P(bits_P), .bits_N(bits_N), .bits_S(bits_S), .bits_Y(bits_Y)) U9 (
	
		.clk(clk),                  
		.rst(rst),                  
		.X(X),	
		.A(A),	
		.N(N), 		
		.STF(STM),				    
		.S(S), 
		.Y(Y),
		.EOF(RDY_WIRE),			
		.I(I)
		);
		
endmodule