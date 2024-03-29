module PRNG_LFSR_tb;

// Define required nets:
logic clk;
logic reset = 1'b0;

logic [4:0] lfsr;


// Instantiate the device under test (dut):
PRNG_LFSR dut (
	.clk(clk),
	.reset(reset),

	.lfsr(lfsr)
);


// Generate the clock:
initial begin
	clk = 1'b1;
	for (int i = 0; i < 40; i++) begin
		clk = ~clk;
		#4;
	end
end

endmodule
