module Counter(
	input Load, Clk,
	output reg K
);
    reg [2:0] i;

    always @(posedge Clk, posedge Load) begin
        if (Load)
            i <= 3'b000; // Reinicia o contador se Load estiver alto
        else if (i != 3'b111)
            i <= i + 1; // Incrementa o contador se Load estiver baixo e K não estiver no valor máximo
    end

    
    always @(*) begin
        if (i == 3'b111) 
            K = 1;
        else
            K = 0;
    end
endmodule
