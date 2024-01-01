module mips(
input clk,
input rst
);
wire [9:0]addr_10;
wire [31:0]addr_32;
wire [31:0]command;
wire en;

wire [4:0]rs;
wire [4:0]rt;
wire [4:0]rd;
wire [15:0]imm;
wire [25:0]imm1;
wire [31:0]nextpc;
wire [31:0]pc_4;
wire zero;

wire [31:0]dm_out;
wire [31:0]busa;
wire [31:0]busb;
wire less;
wire carry;
wire addi;

wire [31:0]ext_out;
wire [9:0]alu_out_10;
wire [31:0]alu_out_32;

wire [1:0]regdst;
wire memwr;
wire [1:0]write_sel;
wire [1:0]pc_sel;
wire [1:0]aluctr;
wire alusrc;
wire [1:0]extop;

im m1(addr_10,command);
controller ctr(command,regdst,memwr,write_sel,pc_sel,aluctr,alusrc,extop,addi,en,bltzal);
splitter spl(command,rs,rt,rd,imm,imm1);
gpr g(alu_out_32,dm_out,pc_4,write_sel,en,clk,rst,busa,busb,rs,rt,rd,rt,regdst,less,carry,addi,bltzal,bltzal_0);
npc npc_1(imm1,addr_32,busa,nextpc,pc_4,pc_sel,zero,bltzal,bltzal_0);
pc pc_1(nextpc,addr_10,addr_32,clk,rst);
ext ext_1(imm,extop,ext_out);
alu alu_1(busa,busb,ext_out,alusrc,addi,aluctr,alu_out_32,alu_out_10,zero,carry,less,bltzal_0);
dm dm_1(alu_out_10,busb,memwr,clk,dm_out);

endmodule