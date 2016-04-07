scantype:       .asciz "%d"
hours:          .word 0
payrate:        .word 0
.text
addr_prompt1:   .word prompt1
addr_prompt2:   .word prompt2
addr_scantype:  .word scantype
addr_hours:     .word hours
addr_payrate:   .word payrate

.global main
main:
push {LR}
sub sp, sp, #8

ldr r0, addr_prompt1    /*First param of printf */
bl printf               /*call printf */

ldr r0, addr_scantype   /* First param of scanf*/
mov r1, sp
bl scanf

ldr r4, [sp]
ldr r0, addr_prompt2
bl printf

ldr r0, addr_scantype
mov r1, sp
bl scanf

ldr r5, [sp]
ldr r0,=string
mov r1, r4
mov r2, r5
bl printf

add sp, sp, #8
pop {PC}
...

root@scw-cb8d4b:~/asm# ./jf
Enter pay rate - round up to nearest dollar.
100
Enter hours.
40
Pay Rate: 100 Hours: 40
