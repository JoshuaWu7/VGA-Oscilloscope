module Fast_Slow_Synchronizer_tb;

logic clk_1;
logic clk_2;

logic [11:0] data_in;
logic [11:0] data_out;

Fast_Slow_Synchronizer #(12) dut (
	.clk_1(clk_1),
	.clk_2(clk_2),

	.data_in(data_in),
	.data_out(data_out)
);

initial begin
	clk_1 = 1'b1;
	data_in = 12'd0;
	for (int i = 0; i < 60; i++) begin
		clk_1 = ~clk_1;
		if (clk_1 == 1'b1 && i > 20)
			data_in = data_in + 12'd1;
		#4;
	end
end

initial begin
	clk_2 = 1'b1;
	for (int i = 0; i < 10; i++) begin
		clk_2 = ~clk_2;
		#22;
	end
end

endmodule
