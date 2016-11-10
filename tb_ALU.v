module tb_ALU;

reg [31:0] ina;
reg [31:0] inb;
reg [3:0] AluOp;
wire [31:0] ALUresult;
wire Zero;

ALU ALU_DUT(ina,inb,Zero,ALUresult,AluOp);

initial begin
	ina = 2;
	inb = 3;
	AluOp = 4'b0010;
	#10 ina = 5; inb = 2; AluOp = 4'b0110;
	#10 ina = 5; inb = 5; AluOp = 4'b0110;
	#50 $finish;
end
endmodule