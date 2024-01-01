module splitter(
input [31:0]data,
output reg [4:0]rs,
output reg [4:0]rt,
output reg [4:0]rd,
output reg [15:0]imm,
output reg [25:0]imm1
);
always@(*)begin
rs={data[25:21]};
rt={data[20:16]};
rd={data[15:11]};
imm={data[15:0]};
imm1={data[25:0]};
end

endmodule 
