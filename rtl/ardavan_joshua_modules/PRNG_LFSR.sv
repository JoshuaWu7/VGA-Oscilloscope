module PRNG_LFSR (
	input logic clk,
	input logic reset,
	
	output logic [4:0] lfsr
);

parameter [4:0] lfsr_init = 5'h01;
reg [4:0] lfsr_reg = lfsr_init;

// Register with D = lfsr[4] and Q = lfsr[3]:
always_ff @ (posedge clk, posedge reset)
	if (reset)
		lfsr_reg[3] <= lfsr_init[3];
	else
		lfsr_reg[3] <= lfsr_reg[4];

// Register with D = lfsr[3] and Q = lfsr[2]:
always_ff @ (posedge clk, posedge reset)
	if (reset)
		lfsr_reg[2] <= lfsr_init[2];
	else
		lfsr_reg[2] <= lfsr_reg[3];

// Register with D = lfsr[2] and Q = lfsr[1]:
always_ff @ (posedge clk, posedge reset)
	if (reset)
		lfsr_reg[1] <= lfsr_init[1];
	else
		lfsr_reg[1] <= lfsr_reg[2];

// Register with D = lfsr[1] and Q = lfsr[0]:
always_ff @ (posedge clk, posedge reset)
	if (reset)
		lfsr_reg[0] <= lfsr_init[0];
	else
		lfsr_reg[0] <= lfsr_reg[1];

// Register with D = lfsr[0] XOR lfsr[2] and Q = lfsr[4]:
always_ff @ (posedge clk, posedge reset)
	if (reset)
		lfsr_reg[4] <= lfsr_init[4];
	else
		lfsr_reg[4] <= lfsr_reg[0] ^ lfsr_reg[2];

// Connect lfsr_reg to lfsr:
assign lfsr = lfsr_reg;
		


endmodule

