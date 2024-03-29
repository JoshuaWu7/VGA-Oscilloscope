module Clock_Divider (
    input logic inclk,
    input logic [31:0] div_clk_count,
    input logic Reset,
    output logic outclk,
    output logic outclk_Not
);

	logic [31:0] count;

    always_ff @ (posedge inclk, negedge Reset) begin
		if (Reset == 1'b0) begin
			count <= 32'b0;
			outclk <= 1'b0;
		end
		else if (count >= div_clk_count - 32'd1) begin
			outclk <= ~outclk;
			count <= 32'b0;
		end
		else
			count <= count + 32'b1;
	end

	assign outclk_Not = ~outclk;

endmodule