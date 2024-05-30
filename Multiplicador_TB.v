`timescale 1ns/100ps

module Multiplicador_TB();

	reg St, Clk;
	reg [3:0]Multiplicando;
	reg [3:0]Multiplicador;
	wire Idle, Done; 
	wire [7:0]Produto;
	


	//Multiplicador(Idle, Done, Produto, St, Clk, Multiplicador, Multiplicando);
	Multiplicador DUT (
		.St(St),
		.Clk(Clk),
		.Multiplicando(Multiplicando),
		.Multiplicador(Multiplicador),
		.Idle(Idle),
		.Done(Done),
		.Produto(Produto)
	);
	
	always #5 Clk = ~Clk;		

	initial begin
		Clk = 0;
		Multiplicando = 0;
		Multiplicador = 0;
		St = 0;

		#10;

		Multiplicando = 4'b0011;
		Multiplicador = 4'b0010;
		St = 1;
		#10;
		St = 0;

		#150;

		Multiplicando = 4'b0101;
		Multiplicador = 4'b0011;
		St = 1;
		#10;
		St = 0;

		#150;

		Multiplicando = 4'b1111;
		Multiplicador = 4'b1111;
		St = 1;
		#10;
		St = 0;

		#150;

		$stop;
	end

endmodule 