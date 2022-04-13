.data
    float_number: .float 6.5
.text

la $t1, float_number
l.s $f12, ($t1)            #f12 = five

cvt.w.s $f0, $f12           #f0 = (int) five
mfc1 $a0, $f0               #a0 = (int)five

li, $v0, 1
syscall
