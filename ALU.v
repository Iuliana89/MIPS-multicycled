module ALU(clk,ina,inb,Zero,ALUresult,AluOp);

input clk;
input [31:0] ina;
input [31:0] inb;
input [3:0] AluOp;
output [31:0] ALUresult;
output Zero;

assign ALUresult = (AluOp == 4'b0010 ? ina+inb : ina - inb);

assign Zero = ((ina==inb && ALUresult==0) ? 1 : 0);

endmodule