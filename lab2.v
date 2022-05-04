`timescale 1ns/1ps

module lab2(
	input clk, clear0, preset0, ip0, ip1,
	output op0, op0bar,
	output [19:0] id_num);

	wire [19:0] id_num = 20'h65166;
	wire d0 = ip0 & ip1;
	wire op0bar = ~op0;

	reg op0;

	always @(posedge clk or negedge clear0 or negedge preset0) begin
		if (clear0 == 1'b0) begin
			op0 <= 1'b0;
		end
		else if (preset0 == 1'b0)
		begin
			op0 <= 1'b1;
		end
		else begin
			op0 <= d0;
		end
	end
endmodule

module lab2_tb();
	reg clktb, clear0tb, preset0tb, ip0tb, ip1tb;
	wire op0tb, op0bartb;
	wire [19:0] id_numtb;

	lab2 lab2_0(
		clktb,clear0tb,preset0tb,
		ip0tb,ip1tb,
		op0tb,op0bartb,
		id_numtb);

	// clock
	initial begin
		clktb = 1'b1;
		forever #50 clktb = ~clktb;
	end

	// header
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab2_tb);

		$display($time, "=========================");
		$display($time, "My name is Cedrik Jiruse");
		$display($time, "My ID Number is X00165166");
		$display($time, "=========================");

		// run clock to the end of the simulation
		@(posedge clktb); // tick1
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
		
		$display($time, " ");
		$display($time, " Simulation finishing.");
		$display($time, " ");

		$stop;
		$finish;
	end

	// preset0 pin
	initial begin
		// tick1
			preset0tb = 1'b1;
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
			#25 preset0tb = 1'b0;
			#25 preset0tb = 1'b1;
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// clear0 pin
	initial begin
		// tick1
			clear0tb = 1'b1; #1
			clear0tb = 1'b0;
			#74
			clear0tb = 1'b1;
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
			#50
			clear0tb = 1'b0;
			#25
			clear0tb = 1'b1;
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
			#25
			clear0tb = 1'b0;
			#50
			clear0tb = 1'b1;
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input0 pin
	initial begin
		// tick1
			ip0tb = 1'b1; #1
			ip0tb = 1'b0;
			#74
			ip0tb = 1'b1;
		@(posedge clktb); // tick2
			#25
			ip0tb = 1'b0;
		@(posedge clktb); // tick3
			#50
			ip0tb = 1'b1;
			#40
			ip0tb = 1'b0;
		@(posedge clktb); // tick4
			#75
			ip0tb = 1'b1;
			#23
			ip0tb = 1'b0;
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
			#10
			ip0tb = 1'b1;
			#65
			ip0tb = 1'b0;
			#15
			ip0tb = 1'b1;
		@(posedge clktb); // tick7
			#75
			ip0tb = 1'b0;
		@(posedge clktb); // tick8
			#25
			ip0tb = 1'b1;
			#50
			ip0tb = 1'b0;
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input1 pin
	initial begin
		// tick1
			ip1tb = 1'b1; #1
			ip1tb = 1'b0;
			#74
			ip1tb = 1'b1;
		@(posedge clktb); // tick2
			#25
			ip1tb = 1'b0;
			#50
			ip1tb = 1'b1;
		@(posedge clktb); // tick3
			#10
			ip1tb = 1'b0;
		@(posedge clktb); // tick4
			#25
			ip1tb = 1'b1;
			#23
			ip1tb = 1'b0;
		@(posedge clktb); // tick5
			#25
			ip1tb = 1'b1;
			#65
			ip1tb = 1'b0;
		@(posedge clktb); // tick6
			#90
			ip1tb = 1'b1;
		@(posedge clktb); // tick7
			#75
			ip1tb = 1'b0;
		@(posedge clktb); // tick8
			#99
			ip1tb = 1'b1;
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end
endmodule