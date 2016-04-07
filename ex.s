.data 
scan0:  .string "%d"
.text
addr_scan:      .word   scan0
...


scan:
push {r0-r3,lr}
sub sp,sp, #4

ldr r0, addr_scan
mov r1, sp
bl scanf
ldr r9, [sp]            

ldr r0, addr_scan
mov r1, sp
bl scanf
ldr r10, [sp]           

ldr r0, addr_scan
mov r1, sp
bl scanf
ldr r11, [sp]           

ldr r0, addr_scan
mov r1, sp
bl scanf
ldr r12, [sp]

add sp, sp, #4


write:
push {r0-r3,lr}
ldr r0,=fmt3
mov r1, r9
mov r2, r10
mov r3, r11
push {r12}
bl printf
pop {r12}
pop {r0-r3,pc}
