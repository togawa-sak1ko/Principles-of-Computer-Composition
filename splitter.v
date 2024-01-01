module splitter(
input [31:0]data,
output wire [4:0]rs,
output wire [4:0]rt,
output wire [4:0]rd,
output wire [15:0]imm,
output wire [25:0]imm1
);
/*always@(*)begin
rs={data[25:21]};
rt={data[20:16]};
rd={data[15:11]};
imm={data[15:0]};
imm1={data[25:0]};
end*/
assign rs={data[25:21]};
assign rt={data[20:16]};
assign rd={data[15:11]};
assign imm={data[15:0]};
assign imm1={data[25:0]};
endmodule 
