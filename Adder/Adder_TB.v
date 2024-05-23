`timescale 1ns/100ps

module Adder_TB();

	reg [3:0] OperandoA, OperandoB;
	wire [4:0] Soma;

	Adder DUT (
		.OperandoA(OperandoA), 
		.OperandoB(OperandoB), 
		.Soma(Soma)
	);
	
	integer i, j;

	initial begin
	OperandoA = 0;
	OperandoB = 0;
	#10;

	for (i = 0; i < 16; i = i + 1) begin
		for (j = 0; j < 16; j = j + 1) begin
			OperandoA = i;
			OperandoB = j;
			#5;
		end
	end

	$stop;
	
	end



endmodule
