main:
li $a0, 5
jal fact
move $a0, $v0
li $v0, 1
syscall
b exit

fact:

bne $a0, 0, else
li $v0, 1
jr $ra

else:

subi $sp, $sp, 8
sw $a0, 0($sp)
sw $ra, 4($sp)
subi $a0, $a0, 1
jal fact

lw $a0, 0($sp)
lw $ra, 4($sp)
addi $sp, $sp, 8

mul $v0, $a0, $v0
jr $ra

exit:
