module timer(
input CLK_I,
input RST_I,
input [3:2]ADDR_I,
input WE_I,
input [31:0]DAT_I,
output wire [31:0]DAT_O,
output wire IRQ
);
reg [31:0] ctrl, preset, count;
  
wire im;
wire [2:1] mode;
wire enable;
assign im = ctrl[3];  
assign mode = ctrl[2:1];  
assign enable = ctrl[0];  
  
assign IRQ = (count==32'b0 && im && mode==2'b00) ? 1 : 0;  
  
assign DAT_O = (ADDR_I == 2'b00) ? ctrl : (ADDR_I == 2'b01) ? preset : (ADDR_I == 2'b10) ? count : count;
  
initial
begin
    ctrl = 32'd0;  
    preset = 32'd0;
    count = 32'd0;
end
  
always@(posedge CLK_I)
begin
if(RST_I)
begin
ctrl = 32'd0; 
preset = 32'd0;
count = 32'd0;
end
else if(WE_I)
begin
case(ADDR_I)
2'b00:
begin
ctrl = DAT_I;
end
2'b01:
begin
preset = DAT_I;
end
2'b10:
begin
count = DAT_I;
end
default:;
endcase
end
else if(enable)
begin
if(count > 0)
begin
count = count - 1;
end
else if(count == 0)
begin
case(mode)
2'b00:;
2'b01:
begin
count = preset;
end
default:;
endcase
end
end
end
  
  
endmodule
