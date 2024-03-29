module Slow_Fast_Synchronizer #(
	parameter N = 12
)
(
	input logic clk_1,
	input logic clk_2,
	
	input logic [N-1:0] data_in,

	output logic [N-1:0] data_out
);

/* Data flip-flops: */

logic [N-1:0] q1;

logic [N-1:0] q3;

logic [N-1:0] q2;
assign data_out = q2;

logic en_3;

always_ff @ (posedge clk_1)
	q1 <= data_in;

always_ff @ (posedge clk_2)
	if (en_3)
		q3 <= q1;
	else
		q3 <= q3;

always_ff @ (posedge clk_2)
	q2 <= q3;


/* Flip-flops needed for the clocks */

logic en_d;

always_ff @ (negedge clk_2)
	en_d <= clk_1;

always_ff @ (negedge clk_2)
	en_3 <= en_d;

endmodule

