module tb_Control;

reg [5:0] OpCode;
wire RegDst;
wire ALUSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire Branch;
wire ALUOp1;
wire ALUOp0;

Control Control_DUT(OpCode,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp0);

initial begin
	OpCode = 6'b0;
	#5 OpCode = 6'b100011;
	#5 OpCode = 6'b101011;
	#5 OpCode = 6'b000100;
	#5 OpCode = 6'b100011;
	#5 OpCode = 6'b101011;
	#5 OpCode = 6'b000100;
	#5 OpCode = 6'b0;
	#100 $finish;
end
endmodule
