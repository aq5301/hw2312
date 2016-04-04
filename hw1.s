    .global main
    .func main
 
 
 @ R1 = first number, R2 = operation, R3 = second number
main:
     BL prompt
     BL scan
     BL function 
     
     B exit

 
 
exit:
    SWI 0

prompt:
    MOV R7, #4
    MOV R0, #1
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR


sum:

difference:

product:

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
    MOV PC, R4

print:
    MOV R4, LR

scan:
    MOV R4, LR
    
    LDR R1, =op_str
    SWI 0
    AND R1, #0xFF 
    MOV PC, R4


 
 
 
 .data
num_str:        .asciz      "%d"
op_str:         .ascii      " "
prompt_str:     .ascii      "Enter in order: a number, an operation, and another number."
