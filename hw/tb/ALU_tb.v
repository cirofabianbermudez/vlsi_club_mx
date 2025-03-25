`timescale 1ns/100ps

`define main_data_size 		8
`define output_data_size 	`main_data_size*2

module ALU_tb;
	
// inputs
reg invalid_data;
reg [3:0] op;
reg [`main_data_size-1:0] in1, in2;

// outputs
wire [`output_data_size-1:0] out;
wire zero, error;

localparam [7:0]
one_n = {`main_data_size{1'b1}},
one_p = -one_n;

//localparam [`main_data_size-1:0]
//one_p = `main_data_size-1'd1,
//one_n = -one_p;

//	initial
//	begin
//		clk = 0;
//		forever
//		#10 clk = ~clk;
//	end
//	
//	initial
//	begin 
//		rst = 0;
//		#20 rst = 1;
//		#20 rst = 0;
//	end

	initial
	begin 
		
		#0 op = 4'b0001;
		
		#45  op = 4'b0001;
		#50  op = 4'b0010;
		#50  op = 4'b0100;
		#50  op = 4'b1000;
	end
	
	initial
	begin 
		
//		#0 in1 = one_p; in2= one_p;
		
//		#0  in1 = one_p; in2= one_n;
//		#50  in1 = one_n; in2= one_p;
		#0  in1 = one_n; in2= one_n;
		#400  in1 = one_n; in2= 0;
		#10  in1 = one_n; in2= one_n;
	end
	
	initial
	begin
		#0 invalid_data = 1'b0;
		#300 invalid_data = 1'b1;
		#10 invalid_data = 1'b0;
	end
	
//DUT
	
ALU #(.WIDTH(`main_data_size))
dut1(
	.in1(in1),
	.in2(in2),
	.op(op),
	.invalid_data(invalid_data), 
	.zero(zero),
	.error(error),
	.out(out)
	); 
	
	
endmodule
	