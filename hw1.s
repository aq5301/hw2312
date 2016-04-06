    .global main
    .func main
 
 
main:
     BL prompt
     BL scanint
     MOV R3, R1
     BL scanchar
     BL scanint
     BL function 
     BL print
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
    MOV R0, R1
    CMP R3, R0  
    MOVGE R0, R3
    MOV PC, LR

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
    LDR R0, =sol_str
    BL printf
    MOV PC, R4

scanint:
    MOV R4, LR
    LDR R0, =num_str
    BL scanf
    LDR R1, [R0]
    MOV PC, R4

scanchar:
    MOV R7, #3
    MOV R0, #0
    MOV R2, #1
    LDR R1, =op_str
    SWI 0
    LDR R2, [R1]
    AND R2, #0xFF 
    MOV PC, LR


 
 
 
 .data
num_str:        .asciz      "%d"
op_str:         .ascii      " "
prompt_str:     .ascii      "Enter in order: a number, an operation, and another number. x to exit\n"
sol_str:        .asciz      "= %d \n"
