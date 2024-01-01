module ext(
input [15:0]din,
input [1:0]extop,
output reg [31:0]dout
);

always@(*)
begin
case(extop)
2'b00:dout={{16{1'b0}},din};
2'b01:dout={{16{din[15]}},din};
2'b10:dout={din,{16{1'b0}}};
default:;

endcase
end

endmodule
