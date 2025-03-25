module ALU #( 
   parameter WIDTH = 8 
) ( 
   input signed [WIDTH-1:0] in1, in2, 
   input  [3:0] op,
   input  invalid_data,
   output signed [2*WIDTH-1:0] out, 
   output zero, 
   output reg error 
);

localparam[2*WIDTH-1:0]
minusOne = {2*WIDTH{1'b1}};

// your code
localparam [3:0]		// Control local parameters
add	= 4'b0001,	// It makes an addition if in1 + in2
sub = 4'b0010,	// It makes a substraction from in1 - in2
mult= 4'b0100,	// It makes the multiplication between in1 * in2
div = 4'b1000;	// It makes the division in1 / in2

//wire signed [2*WIDTH-1:0] in1_aux, in2_aux;
reg signed [2*WIDTH-1:0] out_aux;

always @(op, in1, in2, invalid_data)
	begin
		case(op)
			
			add:
			begin
				if (invalid_data)
					begin
						error = 1'b1;
						out_aux = 0;
					end
				else
					begin
						error = 1'b0;
						out_aux = in1 + in2;  
					end
			end	
			
			sub:
			begin
				if (invalid_data)
					begin
						error = 1'b1;
						out_aux = 0;
					end
				else
					begin
						error = 1'b0;
						out_aux = in1 - in2;    
					end
			end
			
			mult:
			begin
				if (invalid_data)
					begin
						error = 1'b1;
						out_aux = 0;
					end
				else
					begin
						error = 1'b0;
						out_aux = in1 * in2;    
					end
			end
			
			div:
			begin

				if (invalid_data)
					begin
						error = 1'b1;
						out_aux = minusOne;
					end
				else
					begin
						if(in2 == 0)
							begin
								error = 1'b1;
								out_aux = minusOne;
							end
						else
							begin
								error = 1'b0;
								out_aux = in1 / in2;  
							end
					end
			end
			
			default: 
			begin
				error = 1'b0;
				out_aux = 1'b0;
			end
			
			endcase
			
	end
	
//assign in1_aux = in1[WIDTH - 1] ? {8'd255, in1} : {8'd0, in1};
//assign in2_aux = in2[WIDTH - 1] ? {8'd255, in2} : {8'd0, in2};
	
assign zero = out_aux == 0 ? 1'b1 : 0'b0;
assign out = out_aux;
	

endmodule