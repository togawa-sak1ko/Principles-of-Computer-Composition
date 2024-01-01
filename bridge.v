module bridge(
input [31:0]praddr,
input [31:0]prwd,
output [31:0]prrd,
input [31:0]dev0_rd,
input [31:0]dev1_rd,
input [31:0]dev2_rd,
input wecpu,
input irq,
output [3:2]devaddr,
output [31:0]devwd,
output wedev0,
output wedev2,
output [5:0]hwint
);

assign devaddr=praddr[3:2];
assign devwd=prwd;

wire hitdev0,hitdev1,hitdev2;
assign hitdev0=(praddr==32'h00007f00||praddr==32'h00007f04||praddr==32'h00007f08);
assign hitdev1=(praddr==32'h00007f0c);
assign hitdev2=(praddr==32'h00007f10||praddr==32'h00007f14);

assign wedev0=hitdev0&wecpu;
assign wedev2=hitdev0&wecpu;
assign prrd = (hitdev0)?dev0_rd:(hitdev1)?dev1_rd:(hitdev2)?dev2_rd:32'h11111111;

assign hwint={5'b00000,irq};

endmodule
