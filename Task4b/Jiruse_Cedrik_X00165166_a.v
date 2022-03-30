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