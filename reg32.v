module reg32(clk,res,pl,din,dout);

input clk;
input res;
input pl;
input [31:0] din;

output [31:0] dout;
reg [31:0] dout;

always @(posedge clk) begin
	if(res==1'b1) begin
		dout<=32'b0;
	end
	else if(pl==1) begin
		dout<=din;
	end
end

endmodule
			
