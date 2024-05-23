module Multiplicador(Idle, Done, Produto, St, Clk, Multiplicador, Multiplicando);
	input [3:0] Multiplicando;
	input [3:0] Multiplicador;
	input St, Clk;
	
	output Idle, Done;
	output [7:0] Produto;
	
	wire Load, Sh, Ad, K;
	wire [4:0] Soma;
	wire [8:0] out;

	assign Produto = out[7:0];
	
	//module Counter (input Load, Clk,output K);
	Counter Counter (
		.Load(Load), 
		.Clk(Clk), 
		.K(K)
	);
	//module CONTROL (input Clk, K, St, M,	output Idle, Done, Load, Sh, Ad);
	CONTROL CONTROL (
		.Clk(Clk), 
		.K(K), 
		.St(St), 
		.M(Produto[0]), 
		.Idle(Idle), 
		.Done(Done), 
		.Load(Load), 
		.Sh(Sh), 
		.Ad(Ad)
	);
	//module Adder (input [3:0] OperandoA, OperandoB, output [4:0] Soma);
	Adder Adder (
		.OperandoA(Multiplicando),
		.OperandoB(out[7:4]), 
		.Soma(Soma)
	);
	//module ACC (input Load, Sh, Ad, Clk, input [8:0] Entradas, output [8:0] Saidas);
	ACC ACC (
		.Load(Load), 
		.Sh(Sh), 
		.Ad(Ad), 
		.Clk(Clk), 
		.Entradas({Soma, Multiplicador}), 
		.Saidas(out)
	);
	
	
endmodule
