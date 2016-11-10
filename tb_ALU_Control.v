module tb_ALU_Control;

reg [1:0] AluOp;
reg [5:0] funct;
wire [3:0] AluCtrl;

ALU_Control ALU_Control_DUT(AluOp,funct,AluCtrl);

initial begin
	AluOp = 2'b10; funct = 6'b100010;
	#10 
	AluOp = 2'b01; funct = 6'b100000;
	#10 
	AluOp = 2'b00; funct = 6'b100010;
	#10 
	AluOp = 2'b10; funct = 6'b100100;
	#10 
	AluOp = 2'b10; funct = 6'b100101;
	#10 
	AluOp = 2'b10; funct = 6'b101010;
	#10 $finish;
end
endmodule