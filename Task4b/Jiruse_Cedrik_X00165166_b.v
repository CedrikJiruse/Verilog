module full_adder_b(Ain, Bin, Cin, Sout, Cout);

  input [7:0] Ain, Bin;
  input Cin;
  output [7:0] Sout;
  output Cout;

  wire [19:0] id_num = 20'd65166;

  wire [7:0] Sout, carry;
  wire Cout = carry[7];

  full_adder fa_b_0(.A(Ain[0]), .B(Bin[0]), .Ci(Cin),      .S(Sout[0]), .Co(carry[0]));
  full_adder fa_b_1(.A(Ain[1]), .B(Bin[1]), .Ci(carry[0]), .S(Sout[1]), .Co(carry[1]));
  full_adder fa_b_2(.A(Ain[2]), .B(Bin[2]), .Ci(carry[1]), .S(Sout[2]), .Co(carry[2]));
  full_adder fa_b_3(.A(Ain[3]), .B(Bin[3]), .Ci(carry[2]), .S(Sout[3]), .Co(carry[3]));
  full_adder fa_b_4(.A(Ain[4]), .B(Bin[4]), .Ci(carry[3]), .S(Sout[4]), .Co(carry[4]));
  full_adder fa_b_5(.A(Ain[5]), .B(Bin[5]), .Ci(carry[4]), .S(Sout[5]), .Co(carry[5]));
  full_adder fa_b_6(.A(Ain[6]), .B(Bin[6]), .Ci(carry[5]), .S(Sout[6]), .Co(carry[6]));
  full_adder fa_b_7(.A(Ain[7]), .B(Bin[7]), .Ci(carry[6]), .S(Sout[7]), .Co(carry[7]));

endmodule

`timescale 1ns/10ps
module full_adder_b_tb();

reg [7:0] Ain_tb = 8'h0, Bin_tb = 8'h0;
reg Cin_tb = 8'h0;
wire [7:0] Sout_tb;
wire Cout_tb;
wire Cout_Exp, Sout_Exp;
wire [7:0] expected;

reg [17:0] testNum = 0, errorNumber = 0;

event testOutputs;

assign expected = Ain_tb + Bin_tb + Cin_tb;
assign Cout_Exp = expected[1];
assign Sout_Exp = expected[0];

full_adder_b fa_b_inst0(Ain_tb, Bin_tb, Cin_tb, Sout_tb, Cout_tb);

  initial begin
    $display($time, "=========================");
    $display($time, "My name is Cedrik Jiruse");
    $display($time, "My ID Number is X00165166");
    $display($time, "=========================");

    $dumpfile("Jiruse_Cedrik_X00165166_wave_values.vcd");
    $dumpvars(-1, full_adder_b_tb);

    repeat (65536) begin 
      $display($time, " Test %d", testNum);

      {Ain_tb, Bin_tb, Cin_tb} = testNum[17:0]; 
      #5 -> testOutputs;
      #5 testNum = testNum + 8'b1;

      $display($time, " ");
    end

    if (errorNumber == 8'b0) begin
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
    if  ({Cout_tb, Sout_tb} == {Cout_Exp, Sout_Exp}) begin
      $display($time, " Inputs A, B, C = %d", testNum[17:0]);
      $display($time, " Outputs Cout, Sout = %d%d as expected = %d", Cout_tb, Sout_tb, expected);
    end
    else begin
      $display($time, " ERROR");
      $display($time, " Inputs A, B, C = %d", testNum[17:0]);
      $display($time, " Outputs Cout, Sout = %d%d NOT as expected = %d", Cout_tb, Sout_tb, expected);
      errorNumber = errorNumber + 8'b1;
    end
  end
endmodule