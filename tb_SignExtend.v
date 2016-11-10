module tb_SignExtend;

reg [15:0] din;
wire [31:0] dout;

SignExtend SignE(din,dout);

initial begin
	din = 16'b10;
	#10 din = 16'b1111111100000000;
	#10 din = 16'b0111111100000010;
	#10 din = 16'b1111111111111111;
end

endmodule
