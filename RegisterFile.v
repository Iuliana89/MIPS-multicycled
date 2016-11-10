module RegisterFile(clk,ReadReg1,ReadReg2,WriteReg,WriteData,ReadData1,ReadData2,RegWrite);

input clk;
input RegWrite;
input [4:0] ReadReg1;
input [4:0] ReadReg2;
input [4:0] WriteReg;
input [31:0] WriteData;

output [31:0] ReadData1;
output [31:0] ReadData2;

reg [31:0] RM [0:31];

initial begin
	$readmemh("reg.mem",RM);
end

always @(posedge clk)
begin
	if(RegWrite && WriteReg!=0)
		RM[WriteReg]<=WriteData;
end

assign ReadData1=(ReadReg1==0)? 0:RM[ReadReg1];
assign ReadData2=(ReadReg2==0)? 0:RM[ReadReg2];

endmodule