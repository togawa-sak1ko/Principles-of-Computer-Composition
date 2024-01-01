module datareg(
input [31:0] in,
input [31:0] prrd,
input [31:0]addr,
input clk,
output reg [31:0] dout
);
always@(posedge clk)begin
if(addr[15:8]==8'h7f) dout = prrd;
dout = in;

end

endmodule
