`timescale 1ns/1ps

module andFF_V1(ip0, ip1, op0, clk);
  input ip0, ip1, clk;
  output op0;

  wire d0 = ip0 & ip1;
  reg op0;

  always @(posedge clk) begin
    op0 <= d0;
  end
endmodule