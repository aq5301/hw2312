    .global main
    .func main
    
main:
     BL prompt
     BL scan
     MOV R5, R0
     BL scan
     MOV R6, R0
     MOV R1, R5
     MOV R2, R6
     BL count_partitions
     MOV R1, R0
     MOV R2, R5
     MOV R3, R6
     BL print
     
     B exit     @ change to loop at end

exit:
    MOV R7, #1          
	SWI 0   

prompt:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #17
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR
    
print:
    MOV R4, LR
    LDR R0, =print_str
    BL printf
    MOV PC, R4

scan:
    MOV R4, LR              
    SUB SP, SP, #4          
    LDR R0, =scan_str     
    MOV R1, SP              
    BL scanf                
    LDR R0, [SP]            
    ADD SP, SP, #4          
    MOV PC, R4 

count_partitions:
    PUSH {LR}
    CMP R1, #0
    MOVEQ R0, #1
    POPEQ {PC}
    CMP R1, #0
    MOVLT R0, #0
    POPEQ {PC}
    CMP R2, #0
    MOVEQ R0, #0
    POPEQ {PC}
    
    PUSH {R1}
    PUSH {R2}
    MOV R0, R2
    MOV R2, R1
    SUB R1, R0, #1
    BL count_partitions
    SUB R1, R2, R0
    BL prompt
    BL count_partitions
    POP {R1}
    POP {R2}
    ADD R0, R1, R2
    POP  {PC}



.data
scan_str:        .asciz  "%d"
prompt_str:      .asciz  "Enter 2 integers:\n"
print_str:       .asciz  "There are %d partitions of %d using integers up to %d.\n"
