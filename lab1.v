`timescale 1ns/1ps

module lab1(a, b, c);

	input a, b;
	output c;

	wire c = a & b;
endmodule

module lab1_tb();
	reg atb, btb;
	wire ctb;

	lab1 lab1_0(atb, btb, ctb);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(-1, lab1_tb);

		$display($time, "===========================");
		$display($time, " My name is Cedrik Jiruse");
		$display($time, " My ID Number is X00165166");
		$display($time, "===========================");

		atb = 1'b0; btb = 1'b0; #10
		atb = 1'b0; btb = 1'b1; #10
		atb = 1'b1; btb = 1'b0; #10
		atb = 1'b1; btb = 1'b1; #10

		$display($time, " Simulation is over");

		$stop;
		$finish;

	end
endmodule