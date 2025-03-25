`timescale 1ns/100ps

`define main_data_size 		8
`define output_data_size 	`main_data_size*2

module memory_tb;
	
// inputs
reg clk, memoryWrite, memoryRead;
reg [`output_data_size-1:0] memoryWriteData;
reg [`main_data_size-1:0] memoryAddress;

// outputs
wire [`output_data_size-1:0] memoryOutData;

localparam [7:0]
one_n = {`output_data_size{1'b1}},
one_p = -one_n;

	initial
	begin
		clk = 0;
		forever
		#10 clk = ~clk;
	end
	
//	initial
//	begin 
//		rst = 0;
//		#20 rst = 1;
//		#20 rst = 0;
//	end

	initial
	begin 
		forever
		begin
		#0 memoryWrite = 1'b0; memoryRead = 1'b0;
		#10 memoryWrite = 1'b1; memoryRead = 1'b0;
		#10 memoryWrite = 1'b0; memoryRead = 1'b0;
		#50 memoryWrite = 1'b0; memoryRead = 1'b1;
		#10 memoryWrite = 1'b0; memoryRead = 1'b0;
		end

	end
	
	initial
	begin 
		
		#0  memoryWriteData = one_p;

	end	
	
	initial
	begin
		#30000 $finish;

	end

	initial
	begin
		memoryAddress = 0;
		forever
		begin
			#80 memoryAddress = memoryAddress + 1'b1;
		end

	end
	
//DUT
	
memory #(.WIDTH(`main_data_size))
dut1(
	.clk(clk),
	.memoryWrite(memoryWrite),
	.memoryRead(memoryRead),
	.memoryWriteData(memoryWriteData), 
	.memoryAddress(memoryAddress),
	.memoryOutData(memoryOutData)
	);
	
	
endmodule
	