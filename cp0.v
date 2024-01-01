module cp0(
input [31:0]pc,
input [31:0]busb,
input [7:2]hwint,
input [4:0]sel,
input wen,
input exlset,
input exlclr,
input clk,
input rst,
output wire intreq,
output reg [31:0]epc,
output wire [31:0]dout
);
reg [15:10]cause;
reg [31:0]prid;
reg [15:10]im;
reg exl,ie;

assign intreq=|(hwint[7:2]&im[7:2])&ie&(~exl);

assign dout = (sel==12)?{16'b0,im,8'b0,exl,ie}:
				(sel==13)?{16'b0,cause,10'b0}:
				(sel==14)?epc:
				(sel==15)?prid:32'h11111111;

always@(posedge clk or negedge rst)begin
//sr = {{16b'0},im,8'b0,exl,ie};
cause = hwint;
if(rst)begin
im=6'b000000;
exl=0;
ie=0;
cause=6'b000000;
epc=32'h00000000;
epc=32'h00000000;
prid=32'h00000000;
end
else begin
if(wen&&sel==12) {im,exl,ie}={busb[15:10],busb[1],busb[0]};
else if(wen&&sel==13) cause = busb[15:10];
else if(wen&&sel==14) epc = pc;
else if(wen&&sel==15) prid = busb;
if(exlset) exl=1;
if(exlclr) exl=0;
//if(exlset)
//if(intpc)
end
end
endmodule
