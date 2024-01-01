module mips(
input clk,
input rst
);
wire [9:0]addr_10;
wire [31:0]addr_32;
wire [31:0]command;
wire [3:0]next_state;
wire carry;
wire en;
wire [31:0]ir_out;
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

wire lb1;
wire sb1;
wire irwr;
wire pcwr;
wire [31:0]sbout;
wire [9:0]sb_addr;

wire [31:0]ra_out;
wire [31:0]rb_out;
wire [9:0]alureg_out_10;
wire [31:0]alureg_out_32;
wire [31:0]dmreg_out;
wire [3:0]current_state;



im m1(addr_10,command);
controller ctr(ir_out,regdst,memwr,write_sel,pc_sel,aluctr,alusrc,extop,addi,en,clk,rst,zero,pcwr,irwr,lb1,sb1,current_state,next_state);
splitter spl(ir_out,rs,rt,rd,imm,imm1);
gpr g(alureg_out_32,dmreg_out,pc_4,write_sel,en,clk,rst,busa,busb,rs,rt,rd,rt,regdst,less,carry,addi,lb1);
npc npc_1(imm1,addr_32,ra_out,nextpc,pc_4,pc_sel,zero);
pc pc_1(nextpc,addr_10,addr_32,clk,rst,pcwr);
ext ext_1(imm,extop,ext_out);
alu alu_1(ra_out,rb_out,ext_out,alusrc,addi,aluctr,alu_out_32,alu_out_10,zero,carry,less);
dm dm_1(sb_addr,sbout,memwr,clk,dm_out);
rega a(busa,ra_out,clk);
regb b(busb,rb_out,clk);
sb dmsb(dm_out,rb_out,alureg_out_10,sb1,sbout,sb_addr);
aluout alureg(alu_out_32,alu_out_10,alureg_out_32,alureg_out_10,clk);
datareg dreg(dm_out,clk,dmreg_out);
ir ir1(command,ir_out,clk,irwr);

endmodule