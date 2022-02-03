`timescale 1ns/1ps

module andGate(a, b, c);

  input a, b;

  wire c = a | b;
endmodule

module testAnd();
  wire ctb;
  reg atb, btb;

  name1 name1_inst0(atb, btb, ctb);

  initial begin

    atb = 1`b0, btb = 1`b0;
    #5
    atb = 1`b1;
    #5
    btb = 1`b1;
    #5
    atb = 1`b0, btb = 1`b0;
    #5

    $stop;
    $finish;
  end
endmodule