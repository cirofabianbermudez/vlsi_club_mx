`timescale 1ns/100ps

`define main_data_size 		8

module mux4_tb;
	
// inputs
reg [`main_data_size-1:0] din1, din2, din3, din4;
reg [1:0] select;

// outputs
wire dout;

//	initial
//	begin
//		TB_clk_i = 0;
//		forever
//		#10 TB_clk_i = ~TB_clk_i;
//	end
//	
//	initial
//	begin 
//		TB_rst_n_i = 1;
//		#20 TB_rst_n_i = 0;
//		#20 TB_rst_n_i = 1;
//	end	  
	
	initial
	begin 
		
		#0 din1 = 8'd00; din2= 8'd00; din3= 8'd00; din4= 8'd00;
		
		#20  din1 = 8'd10; din2= 8'd20; din3= 8'd30; din4= 8'd40;
	end
	
	initial
	begin
		#0 select = 2'b00; 
		#50 select = 2'b01;
		#50 select = 2'b10;
		#50 select = 2'b11;
	end
	
//DUT
	
mux4 #(.WIDTH(`main_data_size))
dut1(
	.din1(din1),
	.din2(din2),
	.din3(din3),
	.din4(din4),
	.select(select),
	.dout(dout)
	);
	
	
endmodule
	