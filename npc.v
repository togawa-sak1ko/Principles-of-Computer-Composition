module npc(
input [25:0]imm1,
input [31:0]pc,
input [31:0]gpr,
output reg [31:0]npc,
output reg [31:0]pc_4_1,
input [1:0]pc_sel,
input zero,
input intreq,
input [31:0]epc,
input eret
);
reg [15:0]imm;
reg [31:0]pc_4;
initial begin
npc=32'h00003000;
end

always @(*)begin
imm = {imm1[15:0]};
pc_4 = pc+4;
pc_4_1 = pc;
if(intreq)begin
npc = 32'h00004180;
end
else if(eret==1) npc = epc;
case(pc_sel)
2'b00:begin
npc=pc_4;
end
2'b01:begin
if(zero) npc={{14{imm[15]}},imm[15:0],{2'b00}}+pc;
else npc=pc_4;
end
2'b10:begin
npc={pc_4[31:28],imm1[25:0],{2'b00}};
end
2'b11:begin
npc=gpr;
end
default:npc=pc_4;

endcase
end


endmodule
