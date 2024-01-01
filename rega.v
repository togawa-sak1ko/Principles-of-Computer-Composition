module rega(
input [31:0]busa,
output reg [31:0]ra_out,
input clk
);

always@(posedge clk)begin

ra_out = busa;

end

endmodule
