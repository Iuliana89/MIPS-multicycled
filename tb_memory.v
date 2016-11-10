
module tb_memory;

reg clk;
reg wen;
reg MemRead;
reg MemWrite;
reg [31:0] MemIn;
reg [31:0] WriteData;
reg [31:0] Adress;
wire [31:0] MemData;


reg [31:0] M [0:255];

Memory mem(clk,wen,Adress,MemIn,MemData,WriteData,MemRead,MemWrite);

always #5 clk=~clk;

initial begin
	clk=0;
	Adress=0;
	wen = 0;
	WriteData=32'b00000000000000000000000000001000;
	#5 Adress=1; wen=1; MemWrite = 1;
	#10 Adress=7; wen=1; MemWrite = 0;
	#10 Adress=15;
	#10 Adress=16; MemWrite=1;
	
	#10 Adress=4;

	#100 $finish;
end
endmodule