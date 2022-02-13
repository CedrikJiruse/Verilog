`timescale 1ns/1ps

module ff_with_and(
                    input clk, clear0, preset0, ip0, ip1,
                    output op0, op0bar,
                    output [19:0] id_num);

  wire [19:0] id_num = 20'h66165;
  wire d0 = ip0 & ip1;
  wire op0bar = ~op0;

  reg op0;

  always @(posedge clk or negedge clear0 or negedge preset0) begin
    if (clear0 == 1'b0) begin
      op0 <= 1'b0;
    end
    else if (preset0 == 1'b0)
    begin
      op0 <= 1'b1;
    end
    else begin
      op0 <= d0;
    end
  end
endmodule