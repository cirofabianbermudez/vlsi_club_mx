module counter #(parameter bits=4)(
	input clk,
	input rst,
	input select, //0=up counter,1=down counter
	output [bits-1:0] count); 

reg [4:0] countn;



//BUFFD16 b0(.I(countn[0]),.Z(count[0]));
//BUFFD16 b1(.I(countn[1]),.Z(count[1]));
//BUFFD16 b2(.I(countn[2]),.Z(count[2]));
//BUFFD16 b3(.I(countn[3]),.Z(count[3]));
assign count = countn;
	
always@ (posedge clk or posedge rst)
	begin 
		if (rst==1) begin
			countn = 0;			
		end	
	else begin
		case (select)
			1'b0: countn = countn + 1; 
			default: countn = countn - 1;
			endcase
		end
		
	end
endmodule	