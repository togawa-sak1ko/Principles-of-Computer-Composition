module dm(
input [9:0]addr,
input [31:0] din,
input we,
input clk,
output reg [31:0] dout
);
reg [7:0] dm[1023:0];
wire [31:0]temp;

integer i;

initial
	begin
		for (i = 0; i < 1024; i = i + 1)  dm[i] <= 0;
	end


always@(posedge clk)
	begin
		if(we)
		begin
			{dm[addr+3],dm[addr+2],dm[addr+1],dm[addr]} <= din;
		end	
	end
always@(*)
	begin
		dout <= {dm[addr+3],dm[addr+2],dm[addr+1],dm[addr]};
	end

endmodule

