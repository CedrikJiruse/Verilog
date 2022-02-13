`timescale 1ns/1ps

module andGate_tb();
  reg clktb, clear0tb, preset0tb, ip0tb, ip1tb;
  wire op0tb, op0bartb;
  wire [19:0] id_numtb;

  ff_with_and ff_with_and_inst0(
                                clktb,
                                clear0tb,
                                preset0tb,
                                ip0tb,
                                ip1tb,
                                op0tb,
                                op0bartb,
                                id_numtb);

  initial begin
    clktb = 1'b1;
    forever #50 clktb = ~clktb;
  end

  initial begin

    $display($time, "=============================================");
    $display($time, "My name is Cedrik Jiruse - Put your name here");
    $display($time, "My ID Number is X00165166");
    $display($time, "=============================================");

    $dumpfile("ff_with_and_wave_values.vcd");
    $dumpvars(-1, ff_with_and_tb);

    // start of tick1
    preset0tb = 1'b1;
    // end of tick1

    // start of tick2
    @(posedge clktb);
    // end of tick2

    // start of tick3
    @(posedge clktb);
    // end of tick3

    // start of tick4
    @(posedge clktb);
    // end of tick4

    // start of tick5
    @(posedge clktb);
    // end of tick5

    // start of tick6
    @(posedge clktb);
    // end of tick6

    // start of tick7
    @(posedge clktb);
    // end of tick7

    // start of tick8
    @(posedge clktb);
    // end of tick8

    // start of tick9
    // end of tick9

  end
endmodule