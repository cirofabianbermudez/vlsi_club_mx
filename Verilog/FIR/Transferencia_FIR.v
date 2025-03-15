module Transferencia_FIR (
	
    input clk,
    input rst,
    input RDY,
    output reg LDX
	);

	reg registro; // Registro para almacenar el valor retrasado de RDY
	
	always @(*)	begin
		if (registro==1)
			LDX <= 1;
		else 
			LDX <= 0;
			end

	always @(posedge RDY or posedge rst) 
		
    	if (rst) begin
        	registro <= 0;
        	LDX <= 0;	
		end
		
		else begin 
				registro <= 1;			
		end	
		
	always @(negedge clk or posedge rst) 
		
    	if (rst) begin
        	registro <= 0;
        	LDX <= 0;	
		end
		
		else begin 
				registro <= 0;	
		end	  
		
endmodule
	