module MainUnit(clk,res);

input clk;
input res;

wire [31:0] PC_Out;
wire [31:0] PC_In;
wire [31:0] Instruction;     //MemoryOut(MemData)
wire [31:0] Adress;		//mux1Out
wire [31:0] MDROut;

wire [5:0] OpCode;
wire [4:0] ReadRegister1;
wire [4:0] ReadRegister2;
wire [31:0] WriteDataReg; //mux3Out
wire [15:0] Immediate;

wire [31:0] ReadData1;
wire [31:0] ReadData2;
wire [4:0]  WriteRegister;   //Mux2Out

wire [31:0] SignExtendOut;

wire [31:0] regAOut;
wire [31:0] regBOut;  
wire [31:0] Mux4Out;         //AluIn1
wire [31:0] Mux5Out;         //AluIn2
wire [31:0] ALUresult; 
wire [31:0] ALUOut; 

        
wire [3:0] ALUCtrl;
wire [1:0] ALUSrcB;
wire [1:0] PCSource;
wire ALUSrcA;
wire RegDst;
wire PCWriteCond;
wire PCWrite;
wire IorD;
wire IRWrite;
wire MemRead;
wire MemWrite;
wire MemToReg;
wire ALUOp1,ALUOp0;
wire RegWrite;
wire Zero;

Control MainControl(clk,res,OpCode,RegDst,ALUSrcA,ALUSrcB,MemToReg,RegWrite,MemRead,MemWrite,IRWrite,IorD,PCWrite,PCWriteCond,PCSource,ALUOp1,ALUOp0);

reg32 PC(clk,res,(PCWriteCond & Zero) | PCWrite,PC_In,PC_Out);

mux #(32) MUX1(PC_Out,ALUOut,IorD,Adress);

Memory mem(clk,Adress,Instruction,regBOut,MemRead,MemWrite);

InstructionRegister IR(clk,IRWrite,Instruction,OpCode,ReadRegister1,ReadRegister2,Immediate);

reg32 MDR(clk,res,MemRead,Instruction,MDROut);

mux#(5) MUX2(ReadRegister2,Immediate[15:11],RegDst,WriteRegister);

mux #(32) MUX3(ALUOut,MDROut,MemToReg,WriteDataReg);

RegisterFile RegF(clk,ReadRegister1,ReadRegister2,WriteRegister,WriteDataReg,ReadData1,ReadData2,RegWrite);

SignExtend SE(Immediate[15:0],SignExtendOut);

reg32 RegA(clk,res,1'b1,ReadData1,regAOut);

reg32 RegB(clk,res,1'b1,ReadData2,regBOut);

mux #(32) MUX4(PC_Out,regAOut,ALUSrcA,Mux4Out);

mux31 #(32) MUX5(regBOut,32'b1,SignExtendOut,ALUSrcB,Mux5Out);

ALU_Control ALUctrl({ALUOp1,ALUOp0},Immediate[5:0],ALUCtrl);

ALU ALU_Oper(clk,Mux4Out,Mux5Out,Zero,ALUresult,ALUCtrl);

reg32 regALUOut(clk,res,1'b1,ALUresult,ALUOut);

mux31 #(32) MUX6(ALUresult,ALUOut,{PC_Out[31:28],ReadRegister1,ReadRegister2,Immediate,2'b00},PCSource,PC_In);


endmodule

