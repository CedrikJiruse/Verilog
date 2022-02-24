`timescale 1ns/1ps

module task_3(input clk, clear0, preset0, ip0, ip1, ip2, ip3,
              output op0, op0bar, op1, op1bar, op2,
              output [19:0] id_num);

  wire [19:0] id_num = 20'D65166;

  wire d0 = ip0 & ip1;
  wire d1 = ~(ip2 | ip3);
  wire op2 = ~(op0 & op1);

  wire op0bar = ~op0, op1bar = ~op1;

  reg op0, op1;

  always @(posedge clk or negedge clear0 or negedge preset0) begin
    if (clear0 == 1'b0) begin
      op0 <= 1'b0;
      op1 <= 1'b0;
    end
    else if (preset0 == 1'b0)
    begin
      op0 <= 1'b1;
      op1 <= 1'b1;
    end
    else begin
      op0 <= d0;
      op1 <= d1;
    end
  end
endmodule

module task_3_tb();
  reg clktb, clear0tb, preset0tb, ip0tb, ip1tb, ip2tb, ip3tb;
  wire op0tb, op0bartb, op1tb, op1bartb, op2tb;
  wire [19:0] id_numtb;

  task_3 task_3_inst0 (clktb,
                      clear0tb,
                      preset0tb,
                      ip0tb,
                      ip1tb,
                      ip2tb,
                      ip3tb,
                      op0tb,
                      op0bartb,
                      op1tb,
                      op1bartb,
                      op2tb,
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

    $dumpfile("task_3_wave_values.vcd");
    $dumpvars(-1, task_3_tb);

    $display($time, "..");
    $display($time, ".Simulation finishing.");
    $display($time, "..");

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

    $stop;
    $finish;
  end

  // preset0 pin
  initial begin
    preset0tb = 1'b1; // start of tick1
    @(posedge clktb); // start of tick2
    @(posedge clktb); // start of tick3
    @(posedge clktb); // start of tick4
    @(posedge clktb); // start of tick5
    @(posedge clktb); // start of tick6
    @(posedge clktb); // start of tick7
    #25 preset0tb = 1'b0;
    #25 preset0tb = 1'b1;
    
    @(posedge clktb); // start of tick8
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end

  // clear0 pin
  initial begin
    clear0tb = 1'b1; // start of tick1
    #1 clear0tb = 1'b0;
    #74 clear0tb = 1'b1;
    @(posedge clktb); // start of tick2
    @(posedge clktb); // start of tick3
    @(posedge clktb); // start of tick4
    @(posedge clktb); // start of tick5
    @(posedge clktb); // start of tick6
    @(posedge clktb); // start of tick7
    @(posedge clktb); // start of tick8
    #25 clear0tb = 1'b0;
    #25 clear0tb = 1'b1;
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end

  // input0 pin
  initial begin
    ip0tb = 1'b1; // start of tick1
    #1 ip0tb = 1'b0;
    @(posedge clktb); // start of tick2
    #10 ip0tb = 1'b1;
    @(posedge clktb); // start of tick3
    #90 ip0tb = 1'b0;
    @(posedge clktb); // start of tick4
    #75 ip0tb = 1'b1;
    #23 ip0tb = 1'b0;
    @(posedge clktb); // start of tick5
    @(posedge clktb); // start of tick6
    #10 ip0tb = 1'b1;
    @(posedge clktb); // start of tick7
    @(posedge clktb); // start of tick8
    #10 ip0tb = 1'b0;
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end

  // input1 pin
  initial begin
    ip1tb = 1'b1; #1 // start of tick1
    ip1tb = 1'b0;
    #24 ip1tb = 1'b1;
    @(posedge clktb); // start of tick2
    @(posedge clktb); // start of tick3
    #10 ip1tb = 1'b0;
    @(posedge clktb); // start of tick4
    #25 ip1tb = 1'b1;
    #25 ip1tb = 1'b0;
    @(posedge clktb); // start of tick5
    #25 ip1tb = 1'b1;
    @(posedge clktb); // start of tick6
    @(posedge clktb); // start of tick7
    @(posedge clktb); // start of tick8
    #50 ip1tb = 1'b0;
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end

  // input2 pin
  initial begin
    ip2tb = 1'b1; #1 // start of tick1
    ip2tb = 1'b0;
    @(posedge clktb); // start of tick2
    #10 ip2tb = 1'b1;
    @(posedge clktb); // start of tick3
    @(posedge clktb); // start of tick4
    @(posedge clktb); // start of tick5
    @(posedge clktb); // start of tick6
    #10 ip2tb = 1'b0;
    @(posedge clktb); // start of tick7
    #10 ip2tb = 1'b1;
    @(posedge clktb); // start of tick8
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end

  // input3 pin
  initial begin
    ip3tb = 1'b1; #1 // start of tick1
    ip3tb = 1'b0;
    @(posedge clktb); // start of tick2
    #10 ip3tb = 1'b1;
    @(posedge clktb); // start of tick3
    #10 ip3tb = 1'b0;
    @(posedge clktb); // start of tick4
    #10 ip3tb = 1'b1;
    @(posedge clktb); // start of tick5
    #10 ip3tb = 1'b0;
    @(posedge clktb); // start of tick6
    @(posedge clktb); // start of tick7
    @(posedge clktb); // start of tick8
    @(posedge clktb); // start of tick9
    #5

    $stop;
    $finish;
  end
endmodule