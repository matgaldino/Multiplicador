`timescale 1ns/100ps

module Multiplicador_TB();

	reg St, Clk;
	reg [3:0]Multiplicando;
	reg [3:0]Multiplicador;
	wire Idle, Done; 
	wire [7:0]Produto;
	reg [3:0] i = 4'b0000; 


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
	
initial begin

   Clk = 0;
	Multiplicando = 4'b0101;
	Multiplicador = 4'b0000;
	St = 1;
	
	#4 Clk = 1;
	#4 Clk = 0;
		St = 0;
	#4 Clk = 1; 
	#4 Clk = 0; 
	
	for(i = 0; i < 9; i = i + 1)begin
		#4 Clk = 1;
		#4 Clk = 0;
	end
	

	Clk = 0;
	Multiplicando = 4'b0101;
	Multiplicador = 4'b1010;
	St = 1;
	
	#4 Clk = 1;
	#4 Clk = 0;
		St = 0;
	#4 Clk = 1; 
	#4 Clk = 0; 
	
	for(i = 0; i < 9; i = i + 1)begin
		#4 Clk = 1;
		#4 Clk = 0;
	end
	
	Clk = 0;
	Multiplicando = 4'b1111;
	Multiplicador = 4'b1111;
	St = 1;
	
	#4 Clk = 1;
	#4 Clk = 0;
		St = 0;
	#4 Clk = 1; 
	#4 Clk = 0; 
	
	for(i = 0; i < 9; i = i + 1)begin
		#4 Clk = 1;
		#4 Clk = 0;
	end
end
endmodule 