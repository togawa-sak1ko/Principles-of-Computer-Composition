lw $20,0($4) #ȡ�����豸ֵ
lw $21,0($5) #ȡ����豸ֵ
beq $20,$21,end1 #�Ƚ϶��ߣ������ת
sw $20,0($5) #pre<-�����豸ֵ
sw $20,0($6) #cur<-�����豸ֵ
beq $0,$0,end2 #��ת'h4180
end1:lw $21,0($6) #cur<-����豸ֵ
addi $21,$21,1 #�Լ�һ
sw $21,0($6) #�Լӽ��������豸
end2:addi $13,$0,0x000a #���赹��ʱ
sw $13,0($2) #
eret #�жϷ���