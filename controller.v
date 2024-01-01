/*`define addu  6'b100001
`define subu  6'b100011
`define ori   6'b001101
`define lw    6'b100011
`define sw    6'b101011
`define beq   6'b000100
`define jal   6'b000011
`define jr    6'b001000
`define lui   6'b001111
`define typer 6'b000000
`define addi  6'b001000
`define j     6'b000010
`define addiu 6'b001001
`define slt   6'b101010*/

module controller(
input [31:0]din,
output reg [1:0]regdst,
output reg memwr,
output reg [1:0]write_sel,
output reg [1:0]pc_sel,
output reg [1:0]aluctr,
output reg alusrc,
output reg [1:0]extop,
output reg addi,
output reg en,
output reg bltzal
/*output reg [4:0]rs,
output reg [4:0]rt,
output reg [4:0]rd,
output reg [15:0]imm,
output reg [25:0]imm1*/
);

wire [5:0]opcode=din[31:26]; 
wire [5:0]func=din[5:0];

always@(*)begin
case(opcode)
6'b000000:begin//typer
	case(func)
	
	6'b100001:begin//addu
	regdst=2'b00;
	memwr=0;
	pc_sel=2'b00;
	aluctr=2'b00;
	alusrc=0;
	extop=2'b00;
	write_sel=2'b00;
	addi=0;
	en=1;
	bltzal=0;
	end
	
	6'b100011:begin//subu
	regdst=2'b00;
	memwr=0;
	pc_sel=2'b00;
	aluctr=2'b01;
	alusrc=0;
	extop=2'b00;
	write_sel=2'b00;
	addi=0;
	en=1;
	bltzal=0;
	end
	
	6'b001000:begin//jr
	regdst=2'b00;
	memwr=0;
	pc_sel=2'b11;
	aluctr=2'b00;
	alusrc=0;
	extop=2'b00;
	write_sel=2'b00;
	addi=0;
	en=0;
	bltzal=0;
	end
	
	6'b101010:begin//slt
	regdst=2'b00;
	memwr=0;
	pc_sel=2'b00;
	aluctr=2'b01;
	alusrc=0;
	extop=2'b00;
	write_sel=2'b11;
	addi=0;
	en=1;
	bltzal=0;
	end
	
	endcase
end


6'b001101:begin//ori
regdst=2'b01;
memwr=0;
pc_sel=2'b00;
aluctr=2'b10;
alusrc=1;
extop=2'b00;
write_sel=2'b00;
addi=0;
en=1;
bltzal=0;
end

6'b100011:begin//lw
regdst=2'b01;
memwr=0;
pc_sel=2'b00;
aluctr=2'b00;
alusrc=1;
extop=2'b01;
write_sel=2'b01;
addi=0;
en=1;
bltzal=0;
end

6'b101011:begin//sw
regdst=2'b01;
memwr=1;
pc_sel=2'b00;
aluctr=2'b00;
alusrc=1;
extop=2'b01;
write_sel=2'b01;
addi=0;
en=0;
bltzal=0;
end

6'b000100:begin//beq
regdst=2'b01;
memwr=0;
pc_sel=2'b01;
aluctr=2'b01;
alusrc=0;
extop=2'b01;
write_sel=2'b00;
addi=0;
en=0;
bltzal=0;
end

6'b000011:begin//jal
regdst=2'b10;
memwr=0;
pc_sel=2'b10;
aluctr=2'b00;
alusrc=0;
extop=2'b00;
write_sel=2'b10;
addi=0;
en=1;
bltzal=0;
end

6'b001111:begin//lui
regdst=2'b01;
memwr=0;
pc_sel=2'b00;
aluctr=2'b00;
alusrc=1;
extop=2'b10;
write_sel=2'b00;
addi=0;
en=1;
bltzal=0;
end

6'b001000:begin//addi
regdst=2'b01;
memwr=0;
pc_sel=2'b00;
aluctr=2'b00;
alusrc=1;
extop=2'b01;
write_sel=2'b00;
addi=1;
en=1;
bltzal=0;
end

6'b000010:begin//j
regdst=2'b00;
memwr=0;
pc_sel=2'b10;
aluctr=2'b00;
alusrc=0;
extop=2'b00;
write_sel=2'b00;
addi=0;
en=0;
bltzal=0;
end

6'b001001:begin//addiu
regdst=2'b01;
memwr=0;
pc_sel=2'b00;
aluctr=2'b00;
alusrc=1;
extop=2'b01;
write_sel=2'b00;
addi=0;
en=1;
bltzal=0;
end

6'b000001:begin//bltzal
regdst=2'b10;
memwr=0;
pc_sel=2'b01;
aluctr=2'b11;
alusrc=1;
extop=2'b01;
write_sel=2'b10;
addi=0;
en=1;
bltzal=1;
end




endcase
end




endmodule