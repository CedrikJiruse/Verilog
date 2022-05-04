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

module lab4d(
	input [15:0] xin, yin,
	input czin,
	output [15:0] fsum,
	output fcout);

	wire [15:0] sum;
	wire [1:0] cout;
	wire fcout = cout[1];
	wire [15:0] fsum = {sum [15:8], sum [7:0]};

	assign {fcout, fsum} = xin + yin + czin;
endmodule

module lab4d_tb ();

	reg [15:0] xin_tb = 16'b0, yin_tb = 16'b0;
	reg czin_tb = 1'b0;
	wire [15:0] fsum_tb;
	wire fcout_tb;

	reg [17:0] testNum = 18'b0, errorNumber = 18'b0;
	reg [16:0] sum_exp;

	event testOutputs;

	integer ii = 1, jj = 2, kk = 1;

	lab4d lab4d_tb_0(
		xin_tb, yin_tb, czin_tb,
		fsum_tb, fcout_tb);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab4d_tb);

		$display($time, "=========================");
		$display($time, "My name is Cedrik Jiruse");
		$display($time, "My ID Number is X00165166");
		$display($time, "=========================");


		repeat (300000) begin
			xin_tb = $urandom(ii);
			yin_tb = $urandom(jj);
			czin_tb = $urandom(kk);
			#5 ->testOutputs; #5;
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
		sum_exp [16:0] = xin_tb + yin_tb + czin_tb;

		if (sum_exp != {fcout_tb, fsum_tb}) begin
			$display($time, " ");
			$display($time, " ERROR");
			$display($time, " Test = %d", testNum[17:0]);
			$display($time, " Inputs A, B, C = %d %d %b", xin_tb, yin_tb, czin_tb);
			$display($time, " Outputs Cout, Sout = %b %d as expected %d", fcout_tb, fsum_tb, sum_exp);
			$display($time, " ");
			errorNumber = errorNumber + 18'b1;
		end

		testNum = testNum + 18'b1;
	end
endmodule