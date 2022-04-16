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

// full_adder_b fa_b_0(xin[7:0], yin[7:0], czin, sum[7:0], cout[0]);
// full_adder_b fa_b_1(xin[15:8], yin[15:8], cout[0], sum[15:8], cout[1]);

endmodule