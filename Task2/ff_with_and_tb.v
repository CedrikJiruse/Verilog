`timescale 1ns/1ps

module ff_with_and_tb();
  reg clktb, clear0tb, preset0tb, ip0tb, ip1tb;
  wire op0tb, op0bartb;
  wire [19:0] id_numtb;

  ff_with_and ff_with_and_inst0(clktb,
                                clear0tb,
                                preset0tb,
                                ip0tb,
                                ip1tb,
                                op0tb,
                                op0bartb,
                                id_numtb);

  // clock
  initial begin
    clktb = 1'b1;
    forever #50 clktb = ~clktb;
  end

  // header
  initial begin
    $display($time, "=========================");
    $display($time, "My name is Cedrik Jiruse");
    $display($time, "My ID Number is X00165166");
    $display($time, "=========================");

    $dumpfile("./Task2/ff_with_and_wave_values.vcd");
    $dumpvars(-1, ff_with_and_tb);

    // run to the end of the simulation
    @(posedge clktb); // start of tick1
    @(posedge clktb); // start of tick2
    @(posedge clktb); // start of tick3
    @(posedge clktb); // start of tick4
    @(posedge clktb); // start of tick5
    @(posedge clktb); // start of tick6
    @(posedge clktb); // start of tick7
    @(posedge clktb); // start of tick8
    @(posedge clktb); // start of tick9
    
    $display($time, "..");
    $display($time, ".Simulation finishing.");
    $display($time, "..");

    $stop;
    $finish;
  end

  // preset0 pin
  initial begin
    // start of tick1
    preset0tb = 1'b1;
    // start of tick2
    @(posedge clktb);
    // start of tick3
    @(posedge clktb);
    #25 preset0tb = 1'b0;
    #25 preset0tb = 1'b1;
    // start of tick4
    @(posedge clktb);
    // start of tick5
    @(posedge clktb);
    // start of tick6
    @(posedge clktb);
    // start of tick7
    @(posedge clktb);
    // start of tick8
    @(posedge clktb);
    // start of tick9
    @(posedge clktb);
    #5

    $stop;
    $finish;
  end

  // clear0 pin
  initial begin
    // start of tick1
    clear0tb = 1'b1; #1
    clear0tb = 1'b0;
    #74
    clear0tb = 1'b1;
    // start of tick2
    @(posedge clktb);
    // start of tick3
    @(posedge clktb);
    #50
    clear0tb = 1'b0;
    #25
    clear0tb = 1'b1;
    // start of tick4
    @(posedge clktb);
    // start of tick5
    @(posedge clktb);
    // start of tick6
    @(posedge clktb);
    #25
    clear0tb = 1'b0;
    #50
    clear0tb = 1'b1;
    // start of tick7
    @(posedge clktb);
    // start of tick8
    @(posedge clktb);
    // start of tick9
    @(posedge clktb);
    #5

    $stop;
    $finish;
  end

  // input0 pin
  initial begin
    // start of tick1
    ip0tb = 1'b1; #1
    ip0tb = 1'b0;
    #74
    ip0tb = 1'b1;
    // start of tick2
    @(posedge clktb);
    #25
    ip0tb = 1'b0;
    // start of tick3
    @(posedge clktb);
    #50
    ip0tb = 1'b1;
    #40
    ip0tb = 1'b0;
    // start of tick4
    @(posedge clktb);
    #75
    ip0tb = 1'b1;
    #23
    ip0tb = 1'b0;
    // start of tick5
    @(posedge clktb);
    // start of tick6
    @(posedge clktb);
    #10
    ip0tb = 1'b1;
    #65
    ip0tb = 1'b0;
    #15
    ip0tb = 1'b1;
    // start of tick7
    @(posedge clktb);
    #75
    ip0tb = 1'b0;
    // start of tick8
    @(posedge clktb);
    #25
    ip0tb = 1'b1;
    #50
    ip0tb = 1'b0;
    // start of tick9
    @(posedge clktb);
    #5

    $stop;
    $finish;
  end

  // input1 pin
  initial begin
    // start of tick1
    ip1tb = 1'b1; #1
    ip1tb = 1'b0;
    #74
    ip1tb = 1'b1;
    // start of tick2
    @(posedge clktb);
    // start of tick3
    #25
    ip1tb = 1'b0;
    #50
    ip1tb = 1'b1;
    @(posedge clktb);
    #10
    ip1tb = 1'b0;
    // start of tick4
    @(posedge clktb);
    #25
    ip1tb = 1'b1;
    #23
    ip1tb = 1'b0;
    // start of tick5
    @(posedge clktb);
    #25
    ip1tb = 1'b1;
    #65
    ip1tb = 1'b0;
    // start of tick6
    @(posedge clktb);
    #90
    ip1tb = 1'b1;
    // start of tick7
    @(posedge clktb);
    #75
    ip1tb = 1'b0;
    // start of tick8
    @(posedge clktb);
    #99
    ip1tb = 1'b1;
    // start of tick9
    @(posedge clktb);
    #5

    $stop;
    $finish;
  end
endmodule