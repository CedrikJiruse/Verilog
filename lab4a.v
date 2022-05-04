`timescale 1ns/10ps

module lab4a(
	input Ain, Bin, Cin,
	output Sout, Cout);

	wire [19:0] id_num = 20'd65166;

	assign Cout =  (~Ain & Bin & Cin) |
						(Ain & ~Bin & Cin) |
						(Ain & Bin & ~Cin) |
						(Ain & Bin & Cin);

	assign Sout =  (~Ain & ~Bin & Cin) |
						(~Ain & Bin & ~Cin) |
						(Ain & ~Bin & ~Cin) |
						(Ain & Bin & Cin);

endmodule

module lab4a_tb();

	reg Ain_tb, Bin_tb, Cin_tb;
	wire Sout_tb, Cout_tb;
	wire Cout_Exp, Sout_Exp;
	wire [1:0] expected;

	reg [3:0] testNum = 0, errorNumber = 0;

	event testOutputs;

	assign expected = Ain_tb + Bin_tb + Cin_tb;
	assign Cout_Exp = expected[1];
	assign Sout_Exp = expected[0];

	lab4a lab4a_0(
		Ain_tb, Bin_tb, Cin_tb,
		Sout_tb, Cout_tb);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab4a_tb);

		$display($time, "===========================");
		$display($time, " My name is Cedrik Jiruse");
		$display($time, " My ID Number is X00165166");
		$display($time, "===========================");

		repeat (8) begin 
			{Ain_tb, Bin_tb, Cin_tb} = testNum[2:0]; 
			#10 -> testOutputs;
			#10 testNum = testNum + 1'b1;
			#10;
		end

		if (errorNumber == 4'b0) begin
			$display($time, " All Passed ");
			$display($time, "======================");
			$display($time, " Simulation Finishing");
			$display($time, "%d errors detected.", errorNumber);
			$display($time, "=====================.");

			$stop;
			$finish;
		end
		else begin
			$display($time, " Some failed ");
			$display($time, "======================");
			$display($time, " Simulation Finishing");
			$display($time, "%d errors detected.", errorNumber);
			$display($time, "=====================.");

			$stop;
			$finish;
		end
	end

	always @(testOutputs) begin
		if  ({Cout_tb, Sout_tb} != {Cout_Exp, Sout_Exp}) begin
			$display($time, " ERROR");
			$display($time, " Inputs A, B, C = %b", testNum[2:0]);
			$display($time, " Outputs Cout, Sout = %b%b NOT as expected = %b", Cout_tb, Sout_tb, expected);
			errorNumber = errorNumber + 4'b1;
		end
	end
endmodule