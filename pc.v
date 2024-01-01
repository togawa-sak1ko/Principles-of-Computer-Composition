module pc(
input [31:0]pcin,
output reg [12:0]pcout,
output reg [31:0]pcout_31,
input clk,
input rst,
input pcen
);

initial begin
pcout_31 = 32'h00003000;
pcout = 10'b0000000000;
end
always@(posedge clk,posedge rst)begin
if(rst) pcout_31 = 32'h00003000;
else if(pcen)begin
	pcout_31 = pcin;
	pcout = {pcin[12:0]};
end
end


endmodule
