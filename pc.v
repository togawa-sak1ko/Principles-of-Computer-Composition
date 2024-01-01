module pc(
input [31:0]pcin,
output reg [9:0]pcout,
output reg [31:0]pcout_31,
input clk,
input rst
);
always@(posedge clk,posedge rst)begin
if(rst) pcout_31 = 32'h00003000;
else pcout_31 = pcin;
pcout = {pcout_31[9:0]};
end


endmodule
