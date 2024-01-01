addi $1,$0,0x7f00 #$1存ctrl地址
addi $2,$0,0x7f04 #$2存preset地址
addi $3,$0,0x7f08 #$3存count地址
addi $4,$0,0x7f0c #$4存输入设备地址
addi $5,$0,0x7f10 #$5存pre地址
addi $6,$0,0x7f14 #$1存cur地址
#lw $7,0($4) #读输入设备值
addi $7,$0,0x0001 #模拟载入输入设备值
sw $7,0($5) #输入存进pre
sw $7,0($6) #输入存进cur
addi $10,$0,0x0009 #im=1,mode=2'b00,enable=1
addi $11,$0,0x000a #倒计时10个clk
addi $8,$0,0x0401 #im=6'b000001,exl=0,ie=1
mtc0 $8,$12 #im=6'b000001,exl=0,ie=1
mfc0 $25,$12 #读sr寄存器内容
sw $11,0($2) #preset存倒计时
sw $11,0($3) #count存倒计时
sw $10,0($1) #设置ctrl使其可以发出iqr信号
loop:j loop
j loop