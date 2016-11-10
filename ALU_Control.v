module ALU_Control(AluOp,funct,AluCtrl);

input [1:0] AluOp;
input [5:0] funct;
output [3:0] AluCtrl;

reg [3:0] AluCtrl;

always @(AluOp or funct)
	casex({AluOp,funct})
		8'b00_xxxxxx : AluCtrl = 4'b0010; //lw,sw => add
		8'b01_xxxxxx : AluCtrl = 4'b0110; //branch equal => subtract
		8'b10_100000 : AluCtrl = 4'b0010; //ADD => add
		8'b10_100010 : AluCtrl = 4'b0110; //subtract => subtract
		8'b10_100100 : AluCtrl = 4'b0000; //AND => and
		8'b10_100101 : AluCtrl = 4'b0001; //OR => or
		8'b10_101010 : AluCtrl = 4'b0111; //set on less than => slt
	endcase
endmodule