module tb_RegisterFile;

reg clk;
reg RegWrite;
reg [4:0] ReadReg1;
reg [4:0] ReadReg2;
reg [4:0] WriteReg;
reg [31:0] WriteData;

wire [31:0] ReadData1;
wire [31:0] ReadData2;

RegisterFile RegisterFile_DUT(clk,ReadReg1,ReadReg2,WriteReg,WriteData,ReadData1,ReadData2,RegWrite);

reg [31:0] RM [0:31];
always #5 clk=~clk;

initial begin
	clk=0;
	ReadReg1=0;
	ReadReg2=1;
	WriteData=64;

	
	#10 ReadReg1=10; ReadReg2=12; RegWrite=1;WriteReg=5;
	#10 ReadReg1=2; ReadReg2=9; RegWrite=0;


	#50 $finish;
end
endmodule
