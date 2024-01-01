module sb(
input [31:0]dm_out,
input [31:0]busb,
input [9:0]addr,
input sb,
output reg [31:0]dm_in,
output reg [9:0]addr_out
);
always@(*)begin
case(sb)
1'b0:begin
dm_in = busb;
addr_out = addr;
end
1'b1:begin
	addr_out = {addr[9:2],{2'b00}};
	case(addr[1:0])
	2'b00:begin
	dm_in = {dm_out[31:8],busb[7:0]};	
	
	end
	2'b01:begin
	dm_in = {dm_out[31:16],busb[7:0],dm_out[7:0]};
		
	end
	2'b10:begin
	dm_in = {dm_out[31:24],busb[7:0],dm_out[15:0]};	
	
	end
	2'b11:begin
	dm_in = {busb[7:0],dm_out[23:0]};
	
	end
	endcase
end



endcase
end


endmodule
