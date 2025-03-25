module memory #( 
   parameter WIDTH = 8 
   ) ( 
   input clk, memoryWrite, memoryRead,
   input [2*WIDTH-1:0] memoryWriteData,
   input [WIDTH-1:0] memoryAddress,

   output reg [2*WIDTH-1:0] memoryOutData 
);

// your code

	reg [2*WIDTH-1:0] memory [2**WIDTH-1:0];
	
	always @(posedge clk)
		begin
			if (memoryWrite) 
				memory[memoryAddress]<=memoryWriteData;
		end
	
	always @(posedge clk)
		begin
			if (memoryRead)
				memoryOutData<=memory[memoryAddress];
		end

endmodule