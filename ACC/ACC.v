module ACC (
	input Load, Sh, Ad, Clk, 
	input [8:0] Entradas,
	output reg [8:0] Saidas = 9'b000000000
);

	always @(posedge Clk) begin
		if(Load) Saidas = {5'b00000, Entradas[3:0]};
		else if(Sh) Saidas = Saidas >> 1;
		else if(Ad) Saidas[8:4] = Entradas[8:4];
	end
endmodule
