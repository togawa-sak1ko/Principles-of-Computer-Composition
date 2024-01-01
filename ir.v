module ir(
input [31:0]in,
output reg [31:0]out,
input clk,
input en
);
always@(posedge clk)begin

if(en) out=in;

end
endmodule
