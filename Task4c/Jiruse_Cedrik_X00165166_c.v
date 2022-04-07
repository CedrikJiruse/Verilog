`timescale 1ns/10ps
module full_adder(input A, B, Ci,
                  output S, Co);

  wire [19:0] id_num = 20'd65166;

  assign Co = (~A & B & Ci) |
              (A & ~B & Ci) |
              (A & B & ~Ci) |
              (A & B & Ci);

  assign S = (~A & ~B & Ci) |
             (~A & B & ~Ci) |
             (A & ~B & ~Ci) |
             (A & B & Ci);

endmodule

module full_adder_b(Ain, Bin, Cin, Sout, Cout);

  input [7:0] Ain, Bin;
  input Cin;
  output [7:0] Sout;
  output Cout;

  wire [7:0] carry;

  full_adder fa_a_0(Ain[0], Bin[0], Cin,     Sout[0], carry[0]);
  full_adder fa_a_1(Ain[1], Bin[1], carry[0],Sout[1], carry[1]);
  full_adder fa_a_2(Ain[2], Bin[2], carry[1],Sout[2], carry[2]);
  full_adder fa_a_3(Ain[3], Bin[3], carry[2],Sout[3], carry[3]);
  full_adder fa_a_4(Ain[4], Bin[4], carry[3],Sout[4], carry[4]);
  full_adder fa_a_5(Ain[5], Bin[5], carry[4],Sout[5], carry[5]);
  full_adder fa_a_6(Ain[6], Bin[6], carry[5],Sout[6], carry[6]);
  full_adder fa_a_7(Ain[7], Bin[7], carry[6],Sout[7], Cout);

endmodule

module full_adder_c(input [15:0] xin, yin,
                    input czin,
                    output [15:0] fsum,
                    output fcout);

wire [15:0] sum;
wire [1:0] cout;
wire fcout = cout[1];
wire [15:0] fsum = {sum [15:8], sum [7:0]};

// ca4d
assign {fcout, fsum} = xin + yin + czin;

full_adder_b fa_b_0(xin[7:0], yin[7:0], czin, sum[7:0], cout[0]);
full_adder_b fa_b_1(xin[15:8], yin[15:8], cout[0], sum[15:8], cout[1]);

endmodule

module full_adder_c_tb ();

reg [15:0] xin_tb = 16'b0, yin_tb = 16'b0;
reg czin_tb = 1'b0;
wire [15:0] fsum_tb;
wire fcout_tb;

reg [17:0] testNum = 18'b0, errorNumber = 18'b0;
reg [16:0] sum_exp;

event testOutputs;

integer ii = 1, jj = 2, kk = 1;

full_adder_c fa_c_0 (xin_tb, yin_tb, czin_tb, fsum_tb, fcout_tb);

initial begin

  $display($time, "=========================");
  $display($time, "My name is Cedrik Jiruse");
  $display($time, "My ID Number is X00165166");
  $display($time, "=========================");

  $dumpfile("Jiruse_Cedrik_X00165166_wave_values.vcd");
  $dumpvars(-1, full_adder_c_tb);

  //  xin_tb = 16'b0; yin_tb = 16'b0; czin_tb = 1'b0; #10
  //  $display($time,"xin_tb = %d yin_tb = %d czin_tb = %b fsum_tb = %d fcout_tb=%b",xin_tb,yin_tb,czin_tb,fsum_tb,fcout_tb);
  //  #10 xin_tb = 16'd16234; yin_tb = 16'd23410; czin_tb = 1'b1; #10
  //  $display($time,"xin_tb = %d yin_tb = %d czin_tb = %b fsum_tb = %d fcout_tb=%b",xin_tb,yin_tb,czin_tb,fsum_tb,fcout_tb);
  //  #10 xin_tb = 16'd50234; yin_tb = 16'd23410; czin_tb = 1'b1; #10
  //  $display($time,"xin_tb = %d yin_tb = %d czin_tb = %b fsum_tb = %d fcout_tb=%b",xin_tb,yin_tb,czin_tb,fsum_tb,fcout_tb);
  //  #10

  repeat (100000) begin
    xin_tb = $urandom(ii);
    yin_tb = $urandom(jj);
    czin_tb = $urandom(kk);
    #10 ->testOutputs; #10;
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

    if (sum_exp == {fcout_tb, fsum_tb}) begin
      // $display($time, " ");
      // $display($time, " Test = %d", testNum[17:0]);
      // $display($time, " Inputs A, B, C = %d %d %d", Ain_tb, Bin_tb, Cin_tb);
      // $display($time, " Outputs Cout, Sout = %d %d as expected = %d", Cout_tb, Sout_tb, S_exp);
    end
    else begin
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