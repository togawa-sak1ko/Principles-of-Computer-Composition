module dev_output(
input clk,
input rst,
input en,
input [31:0]din,
output [31:0]dout,
input [1:0]sel
);

reg [31:0]pre,cur;

assign dout=(sel==2'b00)?pre:(sel==2'b01)?cur:32'h11111111;

always@(posedge clk or negedge rst)begin
if(en)begin
case(sel)
2'b00:begin
pre=din;
end
2'b01:begin
cur=din;
end
default:;
endcase
end
else if(rst) begin
pre = 0; cur = 0;
end
end



endmodule