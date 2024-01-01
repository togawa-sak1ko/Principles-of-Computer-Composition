module npc(
input [25:0]imm1,
input [31:0]pc,
input [31:0]gpr,
output reg [31:0]npc,
output reg [31:0]pc_4,
input [1:0]pc_sel,
input zero,
input bltzal,
input bltzal_0
);
reg [15:0]imm;

always @(*)begin
imm = {imm1[15:0]};
pc_4 = pc+4;

case(pc_sel)
2'b00:begin
npc=pc_4;
end
2'b01:begin
if(zero) npc={{14{imm[15]}},imm[15:0],{2'b00}}+pc_4;
else if(bltzal==1&&bltzal_0==1) npc={{14{imm[15]}},imm[15:0],{2'b00}}+pc_4;
else npc=pc_4;
end
2'b10:begin
npc={pc_4[31:28],imm1[25:0],{2'b00}};
//if(bltzal==1&&bltzal_0==0) npc=pc_4;
//else npc={pc_4[31:28],imm1[25:0],{2'b00}};
end
2'b11:begin
npc=gpr;
end
default:;

endcase
end


endmodule
