    .global main
    .func main
 
 
main:
     BL prompt
     BL scanint
     MOV R3, R0
     BL scanchar
     MOV R2, R0
     BL scanint
     MOV R1, R0
     BL function 
     MOV R1, R0
     BL print
     B exit

 
exit:
    MOV R7, #4              @ write syscall, 4
    MOV R0, #1              @ output stream to monitor, 1
    MOV R2, #5             @ print string length
    LDR R1, =wrong_str     @ string at label prompt_str:
    SWI 0                   @ execute syscall
    MOV PC, LR 
    @MOV R7, #1
    @SWI 0

prompt:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #69
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR

sum:
    MOV R5, LR
    ADD R0, R1, R3
    MOV PC, R5
    
difference:
    MOV R5, LR
    SUB R0, R1, R3
    MOV PC, R5

product:
    MOV R5, LR
    MUL R0, R1, R3
    MOV PC, R5

max:
    MOV R5, LR
    MOV R0, R1
    CMP R3, R0  
    MOVGE R0, R3
    MOV PC, R5
    
function:
    MOV R4, LR
    CMP R2, #'+'
    BEQ sum
    CMP R2, #'-'
    BEQ difference
    CMP R2, #'*'
    BEQ product
    CMP R2, #'M'
    BEQ max
    BNE exit
    MOV PC, R4

print:
    MOV R4, LR
    LDR R0, =sol_str
    BL printf
    MOV PC, R4

scanint:
    MOV R4, LR              
    SUB SP, SP, #4          
    LDR R0, =num_str     
    MOV R1, SP              
    BL scanf                
    LDR R0, [SP]            
    ADD SP, SP, #4          
    MOV PC, R4   

scanchar:
    MOV R7, #3
    MOV R0, #0
    MOV R2, #1
    LDR R1, =op_str
    SWI 0
    LDR R0, [R1]
    AND R0, #0xFF 
    MOV PC, LR


 
 
 
 .data
num_str:        .asciz      "%d"
op_str:         .ascii      " "
prompt_str:     .asciz      "Enter in order: a number, an operation, and another number.\n"
sol_str:        .asciz      "%d\n"
wrong_str:      .ascii      "wrong"
