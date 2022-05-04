`timescale 1ns/10ps

module lab4a(
	input A, B, Ci,
	output S, Co);

	wire [19:0] id_num = 20'd65166;

	assign Co = (~A & B & Ci) |
					(A & ~B & Ci) |
					(A & B & ~Ci) |
					(A & B & Ci);

	assign S = 	(~A & ~B & Ci) |
					(~A & B & ~Ci) |
					(A & ~B & ~Ci) |
					(A & B & Ci);

endmodule

module lab4b(Ain, Bin, Cin, Sout, Cout);

	input [7:0] Ain, Bin;
	input Cin;
	output [7:0] Sout;
	output Cout;

	wire [7:0] carry;

	lab4a lab4b_0(Ain[0], Bin[0], Cin,     Sout[0], carry[0]);
	lab4a lab4b_1(Ain[1], Bin[1], carry[0],Sout[1], carry[1]);
	lab4a lab4b_2(Ain[2], Bin[2], carry[1],Sout[2], carry[2]);
	lab4a lab4b_3(Ain[3], Bin[3], carry[2],Sout[3], carry[3]);
	lab4a lab4b_4(Ain[4], Bin[4], carry[3],Sout[4], carry[4]);
	lab4a lab4b_5(Ain[5], Bin[5], carry[4],Sout[5], carry[5]);
	lab4a lab4b_6(Ain[6], Bin[6], carry[5],Sout[6], carry[6]);
	lab4a lab4b_7(Ain[7], Bin[7], carry[6],Sout[7], Cout);

endmodule

module lab4b_tb();

	reg [17:0] testNum = 18'b0, errorNumber = 18'b0;

	reg [8:0] S_exp;

	reg [7:0] Ain_tb = 8'b0, Bin_tb = 8'b0;
	reg Cin_tb = 1'b0;
	wire [7:0] Sout_tb;
	wire Cout_tb;

	event testOutputs;

	lab4b lab4b_tb_0(Ain_tb, Bin_tb, Cin_tb, Sout_tb, Cout_tb);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab4b_tb);

		$display($time, "=========================");
		$display($time, "My name is Cedrik Jiruse");
		$display($time, "My ID Number is X00165166");
		$display($time, "=========================");

		repeat (256) begin
			repeat (2) begin
				repeat (256) begin 
					-> testOutputs; #5
					Bin_tb = Bin_tb + 8'b1; #5;
				end
				Cin_tb = ~Cin_tb; #5;
			end
			Ain_tb = Ain_tb + 8'b1; #5;
		end

		if (errorNumber == 18'b0) begin
			$display($time, " ");
			$display($time, " All Passed ");
			$display($time, "======================");
			$display($time, " Simulation Finishing");
			$display($time, " %d tests passed.", testNum);
			$display($time, "=====================.");

			$stop;
			$finish;
		end
		else begin
			$display($time, " ");
			$display($time, " Some failed ");
			$display($time, "======================");
			$display($time, " Simulation Finishing");
			$display($time, " %d errors detected.", errorNumber);
			$display($time, "=====================.");

			$stop;
			$finish;
		end
	end

	always @(testOutputs) begin
		S_exp [8:0] = Ain_tb + Bin_tb + Cin_tb;

		if (S_exp != {Cout_tb, Sout_tb}) begin
			$display($time, " ");
			$display($time, " ERROR");
			$display($time, " Test = %d", testNum[17:0]);
			$display($time, " Inputs A, B, C = %d %d %d", Ain_tb, Bin_tb, Cin_tb);
			$display($time, " Outputs Cout, Sout = %d %d as expected = %d %d", Cout_tb, Sout_tb, S_exp[8], S_exp[7:0]);
			$display($time, " ");
			errorNumber = errorNumber + 18'b1;
		end

		testNum = testNum + 18'b1;
	end
endmodule