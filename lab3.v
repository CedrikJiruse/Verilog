`timescale 1ns/1ps

module lab3(
	input clk, clear0, preset0, ip0, ip1, ip2, ip3,
	output op0, op1, op2,
	output [19:0] id_num);

	wire [19:0] id_num = 20'd65166;

	wire d0 = ip0 & ip1;
	wire d1 = ~(ip2 | ip3);
	wire op2 = ~(op0 & op1);

	reg op0, op1;

	always @(posedge clk or negedge clear0 or negedge preset0) begin
		if (clear0 == 1'b0) begin
			op0 <= 1'b0;
			op1 <= 1'b0;
		end
		else if (preset0 == 1'b0) begin
			op0 <= 1'b1;
			op1 <= 1'b1;
		end
		else begin
			op0 <= d0;
			op1 <= d1;
		end
	end
endmodule

module lab3_tb();
	reg clktb, clear0tb, preset0tb, ip0tb, ip1tb, ip2tb, ip3tb;
	wire op0tb, op1tb, op2tb;
	wire [19:0] id_numtb;

	reg op0_expected, op1_expected, op2_expected;
	reg [15:0] errorCount;
	event testOut1;

	lab3 lab3_0(
		clktb, clear0tb, preset0tb,
		ip0tb, ip1tb, ip2tb, ip3tb,
		op0tb, op1tb, op2tb,
		id_numtb);

	// clock
	initial begin
		clktb = 1'b1;
		forever #50 clktb = ~clktb;
	end

	// header
	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab3_tb);
	
		$display($time, "===========================");
		$display($time, " My name is Cedrik Jiruse");
		$display($time, " My ID Number is X00165166");
		$display($time, "===========================");

		$display($time, " ");
		$display($time, " Simulation finishing");
		$display($time, " ");

		// run to the end of the simulation
		@(posedge clktb); // tick1
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9

		$stop;
		$finish;
	end


	// preset0 pin
	initial begin
		// tick1
			preset0tb = 1'b1; 
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
			#25 preset0tb = 1'b0;
			#25 preset0tb = 1'b1;

		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// clear0 pin
	initial begin
		// tick1
			 clear0tb = 1'b1;
			#1 clear0tb = 1'b0;
			#74 clear0tb = 1'b1;
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
			#25 clear0tb = 1'b0;
			#25 clear0tb = 1'b1;
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input0 pin
	initial begin
			ip0tb = 1'b1; // tick1
			#1 ip0tb = 1'b0;
		@(posedge clktb); // tick2
			#10 ip0tb = 1'b1;
		@(posedge clktb); // tick3
			#90 ip0tb = 1'b0;
		@(posedge clktb); // tick4
			#75 ip0tb = 1'b1;
			#23 ip0tb = 1'b0;
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
			#10 ip0tb = 1'b1;
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
			#10 ip0tb = 1'b0;
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input1 pin
	initial begin
			ip1tb = 1'b1; #1 // tick1
			ip1tb = 1'b0;
			#24 ip1tb = 1'b1;
		@(posedge clktb); // tick2
		@(posedge clktb); // tick3
			#10 ip1tb = 1'b0;
		@(posedge clktb); // tick4
			#25 ip1tb = 1'b1;
			#25 ip1tb = 1'b0;
		@(posedge clktb); // tick5
			#25 ip1tb = 1'b1;
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
			#50 ip1tb = 1'b0;
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input2 pin
	initial begin
			ip2tb = 1'b1; #1 // tick1
			ip2tb = 1'b0;
		@(posedge clktb); // tick2
			#10 ip2tb = 1'b1;
		@(posedge clktb); // tick3
		@(posedge clktb); // tick4
		@(posedge clktb); // tick5
		@(posedge clktb); // tick6
			#10 ip2tb = 1'b0;
		@(posedge clktb); // tick7
			#10 ip2tb = 1'b1;
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// input3 pin
	initial begin
		// tick1
			ip3tb = 1'b1; 
			#1
			ip3tb = 1'b0;
		@(posedge clktb); // tick2
			#10 ip3tb = 1'b1;
		@(posedge clktb); // tick3
			#10 ip3tb = 1'b0;
		@(posedge clktb); // tick4
			#10 ip3tb = 1'b1;
		@(posedge clktb); // tick5
			#10 ip3tb = 1'b0;
		@(posedge clktb); // tick6
		@(posedge clktb); // tick7
		@(posedge clktb); // tick8
		@(posedge clktb); // tick9
			#5

		$stop;
		$finish;
	end

	// expected output, self-checking
	initial begin
		errorCount = 16'b0;

		// tick1
			op0_expected = 1'b1; 
			op1_expected = 1'b1;
			#1
			op0_expected = 1'b0;
			op1_expected = 1'b0;
			op2_expected = 1'b1;
			#50 -> testOut1;
		@(posedge clktb); // tick2
			op1_expected = 1'b1;
			#50 -> testOut1;
		@(posedge clktb); // tick3
			op0_expected = 1'b1;
			op1_expected = 1'b0;
			#50 -> testOut1;
		@(posedge clktb); // tick4
			op0_expected = 1'b0;
			#50 -> testOut1;
		@(posedge clktb); // tick5
			#50 -> testOut1;
		@(posedge clktb); // tick6
			#50 -> testOut1;
		@(posedge clktb); // tick7
			op0_expected = 1'b1;
			op1_expected = 1'b1;
			op2_expected = 1'b0;
			#50 -> testOut1;
		@(posedge clktb); // tick8
			op0_expected = 1'b0;
			op1_expected = 1'b0;
			op2_expected = 1'b1;
			#50 -> testOut1;
		@(posedge clktb); // tick9

		if (errorCount  == 16'b0) begin
			$display($time, " .. ");
			$display($time, " ================ ");
			$display($time, " All tests passed ");
			$display($time, " ================ ");
		end
		else begin
			$display($time, " .. ");
			$display($time, " ======================== ");
			$display($time, " %d tests failed ", errorCount);
			$display($time, " ======================== ");
		end

		$stop;
		$finish;
	end

		// self-checking
	always @(testOut1) begin
		// op0
		if (op0tb != op0_expected) begin
			$display($time, " op0 not test passed ");
			errorCount = errorCount + 16'b1;
		end

		// op1
		if (op1tb != op1_expected) begin
			$display($time, " op1 not test passed ");
			errorCount = errorCount + 16'b1;
		end

		// op2
		if (op2tb != op2_expected) begin
			$display($time, " op2 not test passed ");
			errorCount = errorCount + 16'b1;
		end
	end
endmodule
