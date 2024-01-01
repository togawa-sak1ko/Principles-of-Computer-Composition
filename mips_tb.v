module mips_tb;
reg clk;
reg reset;
reg [31:0] dev1_rd;
integer i;

mips m(clk,reset,dev1_rd);
initial
begin
	dev1_rd = 32'b0;
	reset=1'b0;
	clk=1'b0;

	#50 reset=1'b1;
	#70 reset=1'b0;
	#2000 dev1_rd=32'h00000001;
	#50000 dev1_rd=32'h00001111;
end
always
begin
	#100 clk=~clk;	
	//#2 $display("%2d~%2d:%h %h %h %h %h %h %h %h",8*i,8*i+7,m.g.data[8*i+0],m.g.data[8*i+1],m.g.data[8*i+2],m.g.data[8*i+3],m.g.data[8*i+4],m.g.data[8*i+5],m.g.data[8*i+6],m.g.data[8*i+7]);
end


endmodule

