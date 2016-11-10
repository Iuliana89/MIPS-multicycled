module sum(a,b,suma);

input  [31:0] a;
input  [31:0] b;
output [31:0] suma;

assign suma = a + b;

endmodule