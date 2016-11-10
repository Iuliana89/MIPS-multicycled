module InstructionRegister(clk,IRWrite,din,out1,out2,out3,out4);

input clk;
input IRWrite;

input [31:0] din;
output reg [5:0] out1;
output reg [4:0] out2;
output reg [4:0] out3;
output reg [15:0] out4;

always @(posedge clk)
begin
	if(IRWrite) begin
		out1 <= din[31:26];
		out2 <= din[25:21];
		out3 <= din[20:16];
		out4 <= din[15:0];
	end
end
endmodule


