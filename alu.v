module alu(
input [31:0]ina,
input [31:0]inb1,
input [31:0]imm,
input alusrc,
input addi,
input [1:0]aluctr,
output wire [31:0]out_32,
output wire [9:0]out_10,
output reg zero,
output reg carry,
output reg less
);
reg [31:0]temp;
reg [31:0]inb;
always@(*)
begin
zero=0;
less=0;
case(alusrc)
1'b0:inb=inb1;
1'b1:inb=imm;
default:;
endcase
case(aluctr)
2'b00:begin 
temp=ina+inb;
carry=0;
if(addi)begin
	if (ina[31]==0&&inb[31]==0&&temp[31]==1) begin carry =1; temp=0; end
	else if (ina[31]==1&&inb[31]==1&&temp[31]==0) begin carry =1; temp=0; end 
end

end
2'b01:begin 
temp=ina-inb;
if(temp[31]==1) less = 1;
if(temp == 0) zero = 1;
end
2'b10:temp=ina|inb;

default:;

endcase
end

assign out_32 = temp;
assign out_10 = {temp[9:0]};

endmodule
