module im(
input [12:0]addr,
output wire [31:0]dout
);
reg [7:0]im[8192:0];

initial begin
//$readmemh("p3-test.txt",im,'h1000);
//$readmemh("p3-test-2.txt",im,'h180);
$readmemh("P3_test1.txt",im,'h1000);
$readmemh("P3_test2.txt",im,'h180);
end

assign dout={im[addr],im[addr+1],im[addr+2],im[addr+3]};

endmodule
