    .global main
    .func main
    
main:
     BL prompt
     BL scan
     MOV R5, R0
     BL scan
     MOV R6, R0
     BL count_partitions
     
     BL print
     
     B main


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



.data
scan_str        .asciz  "%d"
prompt_str      .asciz  "Enter 2 integers:\n"
print_str       .asciz  "There are %d partitions of %d using integers up to %d.\n"
