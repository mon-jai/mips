.text

# $f1 = height
# $f2 = weight
# $f3 = bmi
# $f4 = 18
# $f5 = 24

la $a0, input_height
li $v0, 4
syscall

li $v0, 6
syscall
mov.s $f1, $f0

la $a0, input_weight
li $v0, 4
syscall

li $v0, 6
syscall
mov.s $f2, $f0

mul.s $f3, $f1, $f1
div.s $f3, $f2, $f3

mov.s $f12, $f3
li $v0, 2
syscall

l.s $f4, f18
la $a0, too_low
c.lt.s $f3, $f4
bc1t print_result

l.s $f5, f24
la $a0, too_high
c.lt.s $f5, $f3
bc1t print_result

la $a0, ok

print_result:
li $v0, 4
syscall

.data
input_height: .asciiz "Input height: "
input_weight: .asciiz "Input weight: "
too_high: .asciiz "\nToo high"
too_low: .asciiz "\nToo low"
ok: .asciiz "\nOK"
f18: .float 18
f24: .float 24
