module controller(
input [31:0]din,
output wire [1:0]regdst,
output wire memwr,
output wire [1:0]write_sel,
output wire [1:0]pc_sel,
output wire [1:0]aluctr,
output wire alusrc,
output wire [1:0]extop,
output wire addi1,
output wire en,
input clk,
input rst,
input zero,
output wire pcwr,
output wire irwr,
output wire lb1,
output wire sb1,
//output reg [3:0]current_state,
//output reg [3:0]next_state
output reg [3:0]s,
output reg [3:0]ns
);

wire [5:0]opcode=din[31:26]; 
wire [5:0]func=din[5:0];
//parameter [3:0]S0= 4'b0000;
//parameter [3:0]S1= 4'b0001;
//parameter [3:0]S2= 4'b0010;
//parameter [3:0]S3= 4'b0011;
//parameter [3:0]S4= 4'b0100;
//parameter [3:0]S5= 4'b0101;
//parameter [3:0]S6= 4'b0110;
//parameter [3:0]S7= 4'b0111;
//parameter [3:0]S8= 4'b1000;
//parameter [3:0]S9= 4'b1001;
parameter S0 = 0, S1=1 ,S2 = 2,S3=3,S4=4,S5=5,S6=6,S7=7,S8=8,S9=9;
reg [3:0]current_state,next_state;

wire lw = opcode[5]&~opcode[4]&~opcode[3]&~opcode[2]&opcode[1]&opcode[0];
wire sw = opcode[5]&~opcode[4]&opcode[3]&~opcode[2]&opcode[1]&opcode[0];
wire typer = ~opcode[5]&~opcode[4]&~opcode[3]&~opcode[2]&~opcode[1]&~opcode[0];
wire addu = typer&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0];
wire subu = typer&func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0];
wire slt = typer&func[5]& ~func[4] & func[3] & ~func[2] & func[1] & ~func[0];
wire jr = typer&~func[5]& ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];
wire ori = ~opcode[5]&~opcode[4] & opcode[3] & opcode[2] & ~opcode[1] & opcode[0];
wire beq = ~opcode[5]&~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
wire lui = ~opcode[5]&~opcode[4] & opcode[3] & opcode[2] & opcode[1] & opcode[0];
wire j = ~opcode[5]&~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0];
wire addi = ~opcode[5]&~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
wire addiu = ~opcode[5]&~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0];
wire jal = ~opcode[5]&~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
wire lb = opcode[5]&~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];
wire sb = opcode[5]&~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];

always@(posedge clk or posedge rst)
begin
if(rst)
begin
current_state <= S0;
end
else
begin
current_state <= next_state;
end
s=current_state;
ns=next_state;
end
  
always@(*)
begin
case(current_state)
S0:
begin
next_state = S1;
end
S1:
begin
if(lw||sw||lb||sb)
begin
next_state = S2;
end
else if(addu||subu||ori||lui||addi||addiu||slt)
begin
next_state=S6;
end
else if(beq||jr)
begin
next_state=S8;
end
else if(j||jal)
begin
next_state=S9;
end
else next_state=S0;
end
S2:
begin
if(lw | lb)
begin
next_state=S3;
end
else if(sw|sb)
begin
next_state=S5;
end
else next_state=S0;
end
S3:
begin
next_state=S4;
end
S4:
begin
next_state=S0;
end
S5:
begin
next_state=S0;
end
S6:
begin
if(addu||subu||ori||lui||addi||addiu||slt)
begin
next_state=S7;
end
else next_state=S0;
end
S7:
begin
next_state=S0;
end
S8:
begin
next_state=S0;
end
S9:
begin
next_state=S0;
end
default:
begin
next_state=S0;
end
endcase
end

wire s0,s1,s2,s3,s4,s5,s6,s7,s8,s9;

assign s0=(~current_state[3])&(~current_state[2])&(~current_state[1])&(~current_state[0]);
assign s1=(~current_state[3])&(~current_state[2])&(~current_state[1])&( current_state[0]);
assign s2=(~current_state[3])&(~current_state[2])&( current_state[1])&(~current_state[0]);
assign s3=(~current_state[3])&(~current_state[2])&( current_state[1])&( current_state[0]);
assign s4=(~current_state[3])&( current_state[2])&(~current_state[1])&(~current_state[0]);
assign s5=(~current_state[3])&( current_state[2])&(~current_state[1])&( current_state[0]);
assign s6=(~current_state[3])&( current_state[2])&( current_state[1])&(~current_state[0]);
assign s7=(~current_state[3])&( current_state[2])&( current_state[1])&( current_state[0]);
assign s8=( current_state[3])&(~current_state[2])&(~current_state[1])&(~current_state[0]);
assign s9=( current_state[3])&(~current_state[2])&(~current_state[1])&( current_state[0]);

assign regdst[0]=ori||lw||sw||beq||lui||addi||addiu||lb||sb;
assign regdst[1]=jal;
assign memwr=(sw||sb)&s5;
assign pc_sel[0]=(jr||beq)&(~s0);
assign pc_sel[1]=(j||jal||jr)&(~s0);
assign aluctr[0]=(subu||slt||beq);
assign aluctr[1]=ori;
assign alusrc=ori||lw||sw||lb||sb||lui||addi||addiu;
assign extop[0]=addiu||addi||beq||sw||sb||lw||lb;
assign extop[1]=lui;
assign write_sel[0]=lw||lb||slt||sw||sb;
assign write_sel[1]=jal||slt;
assign addi1=(addi==1)?1:0;
assign en=((addu||subu||ori||lui||addi||addiu||slt)&s7)||((lw||lb)&s4)||(jal&s9);
assign pcwr=s0||((jal||j)&s9)||((beq&zero)&s8)||(jr&s8);
assign irwr=s0;
assign lb1=(lb==1)?1:0;
assign sb1=(sb==1)?1:0;





endmodule
