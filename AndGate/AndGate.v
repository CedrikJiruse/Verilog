`timescale 1ns/1ps

module andGate(a, b, c);

  input a, b;
  output c;

  wire c = a & b;
endmodule