addi $1,$0,0x7f00 #$1��ctrl��ַ
addi $2,$0,0x7f04 #$2��preset��ַ
addi $3,$0,0x7f08 #$3��count��ַ
addi $4,$0,0x7f0c #$4�������豸��ַ
addi $5,$0,0x7f10 #$5��pre��ַ
addi $6,$0,0x7f14 #$1��cur��ַ
#lw $7,0($4) #�������豸ֵ
addi $7,$0,0x0001 #ģ�����������豸ֵ
sw $7,0($5) #������pre
sw $7,0($6) #������cur
addi $10,$0,0x0009 #im=1,mode=2'b00,enable=1
addi $11,$0,0x000a #����ʱ10��clk
addi $8,$0,0x0401 #im=6'b000001,exl=0,ie=1
mtc0 $8,$12 #im=6'b000001,exl=0,ie=1
mfc0 $25,$12 #��sr�Ĵ�������
sw $11,0($2) #preset�浹��ʱ
sw $11,0($3) #count�浹��ʱ
sw $10,0($1) #����ctrlʹ����Է���iqr�ź�
loop:j loop
j loop