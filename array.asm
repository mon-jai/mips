clear1: # clear1(int array[], int size);
move $t0, $zero # $t0 = i = 0;

loop:
bge $t0, $a0, end
sll $t1, $t0, 2 # $t1 = $t0 * 4
add $t2, $a0, $t1 # $t2 = &array[i]
sw $zero, 0($t2)
addi $t0, $t0, 1 # i += 1
j loop

end:

clear2: # clear2(int* array, int size);
move $t0, $a0 # $t0 = p = &array[0];
sll $t1, $a1, 2 # $t1 = size * 4
add $t2, $a0, $t1 # $t2 = &array[size]

loop:
bge $t0, $t2, end # if (p >= &array[size]) break;
sw $zero, 0($a0) # *p = 0
addi $t0, $t0, 4 # p = p + 1
j loop

end:
