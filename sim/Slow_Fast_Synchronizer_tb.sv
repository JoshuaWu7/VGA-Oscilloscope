module Slow_Fast_Synchronizer_tb;

logic clk_1;
logic clk_2;

logic [11:0] data_in;
logic [11:0] data_out;

Slow_Fast_Synchronizer #(12) dut (
	.clk_1(clk_1),
	.clk_2(clk_2),

	.data_in(data_in),
	.data_out(data_out)
);

initial begin
	clk_1 = 1'b1;
	data_in = 12'd0;
	for (int i = 0; i < 20; i++) begin
		clk_1 = ~clk_1;
		if (clk_1 == 1'b1 && i > 2)
			data_in = data_in + 12'd1;
		#22;
	end
end

initial begin
	clk_2 = 1'b1;
	for (int i = 0; i < 120; i++) begin
		clk_2 = ~clk_2;
		#4;
	end
end

endmodule
