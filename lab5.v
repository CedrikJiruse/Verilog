module traffic_lights(
	input clock, resetL, change,
	output redout, yellowout, greenout);

	wire redout, yellowout, greenout;

	parameter [1:0] red    = 2'b00;
	parameter [1:0] yellow = 2'b10;
	parameter [1:0] green  = 2'b01;

	reg [1:0] lights;

	// decode the outputs from the FSM state bits
	assign redout    = ((~lights[1]) & (~lights[0]));
	assign greenout  = ((~lights[1]) & ( lights[0]));
	assign yellowout = (( lights[1]) & (~lights[0]));

	always @(posedge clock or negedge resetL) begin
		if (resetL == 1'b0) begin
			lights <= red;
		end
		
		else begin
			case (lights)
				red: begin
					if (change == 1'b1) begin
						lights <= green;

					end
					else begin
						lights <= red;
					end
				end

				green: begin
					if (change == 1'b1) begin
						lights <= yellow;
					end
				end

				yellow: begin
					if (change == 1'b1) begin
						lights <= red;
					end
					else begin
						lights <= yellow;
					end
				end

				default: begin
					lights <= red;
				end
			endcase
		end
	end
endmodule

