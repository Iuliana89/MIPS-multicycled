module mux31(a,b,c,sel,out);

parameter DATA_LENGTH = 8;
input [DATA_LENGTH-1:0] a;
input [DATA_LENGTH-1:0] b;
input [DATA_LENGTH-1:0] c;
input [1:0] sel;
output [DATA_LENGTH-1:0] out;

assign out = (sel == 2'b00 ? a : (sel == 2'b01 ? b : c));

endmodule 