module SignExtend(din,dout);

input [15:0] din;
output [31:0] dout;

assign dout = (din[15]==1 ? {16'b1111111111111111,din} : {16'b0,din});

endmodule
