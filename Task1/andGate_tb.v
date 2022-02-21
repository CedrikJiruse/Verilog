`timescale 1ns/1ps

module andGate_tb();
  reg atb, btb;
  wire ctb;

  andGate andGate_inst0(atb, btb, ctb);

  initial begin

    $display($time, "=============================================");
    $display($time, "My name is Cedrik Jiruse - Put your name here");
    $display($time, "My ID Number is X00165166");
    $display($time, "=============================================");

    $dumpfile("./Task1/andGate_wave_values.vcd");
    $dumpvars(-1, andGate_tb);

    atb = 1'b0; btb = 1'b0; #10
    atb = 1'b0; btb = 1'b1; #10
    atb = 1'b1; btb = 1'b0; #10
    atb = 1'b1; btb = 1'b1; #10

    $display($time, "Simulation is over");

    $stop;
    $finish;

  end
endmodule