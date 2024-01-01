`timescale 1ns/1ns;

module mips_tb;
reg clk;
reg reset;
integer i;

mips m(clk,reset);
initial
begin
	reset=1'b0;
	clk=1'b0;

	#1 reset=1'b1;
	#1 reset=1'b0;	
end
always
begin
	#10 clk=~clk;	
	#2 $display("%2d~%2d:%h %h %h %h %h %h %h %h",8*i,8*i+7,m.g.data[8*i+0],m.g.data[8*i+1],m.g.data[8*i+2],m.g.data[8*i+3],m.g.data[8*i+4],m.g.data[8*i+5],m.g.data[8*i+6],m.g.data[8*i+7]);
end
initial
begin
	$monitor("%h",m.m1.dout);
end
always
begin
		#10 for(i=0;i<4;i=i+1)
		$display("%2d~%2d:%h %h %h %h %h %h %h %h",8*i,8*i+7,m.g.data[8*i+0],m.g.data[8*i+1],m.g.data[8*i+2],m.g.data[8*i+3],m.g.data[8*i+4],m.g.data[8*i+5],m.g.data[8*i+6],m.g.data[8*i+7]);
end

endmodule
