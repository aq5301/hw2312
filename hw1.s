    .global main
    .func main
 
 
main:
     BL prompt
     BL scanint
     MOV R1, R0
      BL print
     BL scanchar
     MOV R1, R0
      BL print
     BL scanint
     MOV R1, R0
      BL print
     BL function 
     MOV R1, R0
     BL print
     B exit


prompt:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #60
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR

sum:
    MOV R5, LR
    ADD R0, R1, R2
    MOV PC, R5
    
difference:
    MOV R5, LR
    SUB R0, R1, R2
    MOV PC, R5

product:
    MOV R5, LR
    MUL R0, R1, R2
    MOV PC, R5

max:
    MOV R5, LR
    MOV R0, R8
    CMP R2, R0  
    MOVGE R0, R2
    MOV PC, R5
    
function:
    MOV R4, LR
    CMP R6, #'+'
    BEQ sum
    CMP R6, #'-'
    BEQ difference
    CMP R6, #'*'
    BEQ product
    CMP R6, #'M'
    BEQ max
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
prompt_str:     .ascii      "Enter in order: a number, an operation, and another number.\n"
sol_str:        .asciz      "=%d\n"
