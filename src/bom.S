.attribute arch, "rv64gc"

.extern __end
.global boot

.text

boot:
   la sp, __end + 8192  


   la a0, hello_log
   call kprint

   b: c.j b



kprint:
   c.li a6, 0
   c.li a7, 1
   c.mv a1, a0

   kprint_inner:
     lb a0, 0(a1)
     c.beqz a0, print_exit

     ecall

     c.addi a1, 1

     c.j kprint_inner

print_exit:
    ret

hello_log:
   .asciz "Bom\n" 
