main:
li $a0, 10
jal fibonacci
move $a0, $v0
li $v0, 1
syscall
j exit

fibonacci: # int Fibonacci(int n);
bgt $a0, 2, else
li $v0, 1
jr $ra

# $sp = [$a0, $ra, f(n - 1)]
else:
subi $sp, $sp, 12
sw $a0, 0($sp)
sw $ra, 4($sp)

subi $a0, $a0, 1
jal fibonacci
sw $v0, 8($sp)

lw $a0, 0($sp) # $a0 = n
subi $a0, $a0, 2
jal fibonacci

lw $t0, 8($sp) # $t0 = f(n - 1)
add $v0, $t0, $v0
lw $ra, 4($sp)
addi $sp, $sp, 12
jr $ra

exit:
