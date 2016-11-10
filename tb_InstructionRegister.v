module tb_InstructionRegister;
reg clk;
reg IRWrite;

reg [31:0] din;
wire [5:0] out1;
wire [4:0] out2;
wire [4:0] out3;
wire [15:0] out4;

InstructionRegister IR(clk,IRWrite,din,out1,out2,out3,out4);

always #5 clk=~clk;

initial begin
	clk=0; IRWrite = 0; din=32'b10001001101010011010000111101010;
	#10 IRWrite = 1;

	#50 $finish;
end

endmodule