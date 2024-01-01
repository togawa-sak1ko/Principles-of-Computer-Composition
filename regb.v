module regb(
input [31:0]busb,
output reg [31:0]rb_out,
input clk
);

always@(posedge clk)begin

rb_out = busb;

end

endmodule

