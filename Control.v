module Control(clk,res,OpCode,RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0);

input clk;
input res;
input [5:0] OpCode;
output RegDst;
output ALUSrcA;
output [1:0] ALUSrcB;
output MemToReg;
output RegWrite;
output MemRead;
output MemWrite;
output IRWrite;
output IorD;
output PCWrite;
output PCWriteCond;
output [1:0] PCSource;
output ALUOp1;
output ALUOp0;

reg RegDst;
reg ALUSrcA;
reg [1:0] ALUSrcB;
reg MemToReg;
reg RegWrite;
reg MemRead;
reg MemWrite;
reg IRWrite;
reg IorD;
reg PCWrite;
reg PCWriteCond;
reg [1:0] PCSource;
reg ALUOp1;
reg ALUOp0;

reg [3:0] state_crt;
reg [3:0] state_next;

always@(posedge clk) 
begin
	if (res == 1'b1)
	begin
		state_crt <= 4'b0000;
	end
	else
		state_crt <= state_next;
end

always @(state_crt) begin
	case ({state_crt})
	4'b0000: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_01_0_0_1_0_1_0_1_0_00_0_0; end
	4'b0001: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_11_0_0_0_0_0_0_0_0_00_0_0; end
	4'b0010: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_1_10_0_0_0_0_0_0_0_0_00_0_0; end
	4'b0011: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_00_0_0_1_0_0_1_0_0_00_0_0; end
	4'b0100: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_00_1_1_0_0_0_0_0_0_00_0_0; end
	4'b0101: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_00_0_0_0_1_0_1_0_0_00_0_0; end
	4'b0110: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_1_00_0_0_0_0_0_0_0_0_00_1_0; end
	4'b0111: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b1_0_00_0_1_0_0_0_0_0_0_00_0_0; end
	4'b1000: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_1_00_0_0_0_0_0_0_0_1_01_0_1; end
	4'b1001: begin {RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0} = 16'b0_0_00_0_0_0_0_0_0_1_0_10_0_0; end	
endcase
end

always @(state_crt or OpCode)
begin
	casex ({state_crt,OpCode})
	10'b0000_xxxxxx : begin state_next = 4'b0001; end
	10'b0001_10x011 : begin state_next = 4'b0010; end
	10'b0001_000000 : begin state_next = 4'b0110; end
	10'b0001_000100 : begin state_next = 4'b1000; end
	10'b0001_000010 : begin state_next = 4'b1001; end
	10'b0010_100011 : begin state_next = 4'b0011; end
	10'b0010_101011 : begin state_next = 4'b0101; end
	10'b0011_xxxxxx : begin state_next = 4'b0100; end
	10'b0100_xxxxxx : begin state_next = 4'b0000; end
	10'b0101_xxxxxx : begin state_next = 4'b0000; end
	10'b0110_xxxxxx : begin state_next = 4'b0111; end
	10'b0111_xxxxxx : begin state_next = 4'b0000; end
	10'b1000_xxxxxx : begin state_next = 4'b0000; end
	10'b1001_xxxxxx : begin state_next = 4'b0000; end
	default : begin state_next = 4'bzzzz; end
	endcase
end
endmodule