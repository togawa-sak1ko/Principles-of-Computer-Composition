module aluout(
input [31:0]in_32,
input [9:0]in_10,
output reg [31:0]out_32,
output reg [9:0]out_10,
input clk
);
always@(posedge clk)begin
out_32 <= in_32;
out_10 <= in_10;

end
endmodule
