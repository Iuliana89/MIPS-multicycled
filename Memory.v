module Memory(clk,Adress,MemData,WriteData,MemRead,MemWrite);

input clk;
input MemRead;
input MemWrite;
input [31:0] Adress;
input [31:0] WriteData;
output [31:0] MemData;


reg [31:0] M [0:255];
initial begin
	$readmemh("memory.mem",M,0);
end

always @(posedge clk)
begin
	if(MemWrite == 1'b1) begin
		M[Adress]=WriteData;
	end
end

assign MemData = (MemRead == 1'b1) ? M[Adress] : Adress;

endmodule