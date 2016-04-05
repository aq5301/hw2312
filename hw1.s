    .global main
    .func main
 
 
 @ R1 = first number, R2 = operation, R3 = second number
main:
     BL prompt
     @BL scanint
      BL scanchar
    @ BL scanint
     @BL function 
     @BL print
     B main

 
exit:
    MOV R7, #1
    SWI 0

prompt:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #69
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR

sum:
    ADD R0, R1, R3
    MOV PC, LR
    
difference:
    SUB R0, R1, R3
    MOV PC, LR

product:
    MUL R0, R1, R3
    MOV PC, LR

max:

function:
    CMP R2, #'+'
    BEQ sum
    CMP R2, #'-'
    BEQ difference
    CMP R2, #'*'
    BEQ product
    CMP R2, #'M'
    BEQ max
    CMP R2, #'x'
    BEQ exit
    MOV PC, R4

print:
    MOV R4, LR

scanint:
    MOV R4, LR

scanchar:
    MOV R4, LR
    LDR R2, =op_str
    SWI 0
    AND R2, #0xFF 
    MOV PC, R4


 
 
 
 .data
num_str:        .asciz      "%d"
op_str:         .ascii      " "
prompt_str:     .ascii      "Enter in order: a number, an operation, and another number. x to exit\n"
sol_str:        .asciz      "= %d \n"
