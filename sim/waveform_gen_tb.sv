module waveform_gen_tb;

logic clk;
logic reset;

logic [31:0] phase_inc = 32'd200000000;

logic [11:0] sin_out;
logic [11:0] cos_out;
logic [11:0] squ_out;
logic [11:0] saw_out;

waveform_gen dut (
	.clk(clk),
	.reset(reset),
	
	.en(1'b1),

	.phase_inc(phase_inc),

	.sin_out(sin_out),
	.cos_out(cos_out),
	.squ_out(squ_out),
	.saw_out(saw_out)
);

initial begin
	clk = 1'b1;
	for (int i = 0; i < 400; i++) begin
		clk = ~clk;
		#4;
	end
end

initial begin
	reset = 1'b1;
	#1;
	reset = 1'b0;
	#1;
	reset = 1'b1;
end

endmodule