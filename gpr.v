module gpr(
input [31:0]aluout,
input [31:0]dm_out,
input [31:0]pc_4,
input [1:0]write_sel,
input en,
input clk,
input rst,
output wire [31:0]busa,
output wire [31:0]busb,
input [4:0]ra,
input [4:0]rb,
input [4:0]wr1,
input [4:0]wr2,
input [1:0]regdst,
input less,
input carry,
input addi,
input lb
);
reg [31:0]data[31:0];
integer i;
reg [4:0]wr;
reg [31:0]din;

initial
begin
for(i=0;i<32;i=i+1) data[i]=0;
end

always @(posedge clk)begin
case(regdst)
2'b00:begin
wr = wr1;
end
2'b01:begin
wr = wr2;
end
2'b10:begin
wr = 5'b11111;
end
default:;
endcase

case(write_sel)
2'b00:begin
din = aluout;
end
2'b01:begin
//din = dm_out;
	if(lb) din = {{24{dm_out[7]}},dm_out[7:0]};
	else din = dm_out;
end
2'b10:begin
din = pc_4;
end
2'b11:begin
if(less) din=32'h00000001;
else din =32'h00000000;
end
default:;
endcase

if(rst)begin
for(i=0;i<32;i=i+1) data[i]=0;
end
/*else if(wr)begin
if(wr!=0) data[wr]=din;
end
else if(addi&&carry)begin
if(wr!=0) data[wr]=din;
data[5'b11110]=1;
end*/
if(en)begin
	if(wr!=0)begin
		if(addi&&carry)begin
			data[wr]=din;
			data[5'b11110]=1;
		end
		else data[wr]=din;
	end
end

end


assign busa=data[ra];
assign busb=data[rb]; 

 
endmodule
