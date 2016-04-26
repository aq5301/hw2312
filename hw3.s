    .global main
    .func main
   
   
   
main:
    BL prompt
    BL scanint 
    MOV R5, R0
    MOV R0, #0
    B generate	

   
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

read_arrays:



print:
    PUSH {LR}
    LDR R0, =print_str
    BL printf
    POP {PC}


generate:
    CMP R0, #20
    BEQ sort_ascending
    LDR R1, =a
    LSL R2, R0, #2
    ADD R2, R1, R2
    
    ADD R3, R5, R0
    STR R3, [R2]
    
    ADD R3, R5, R0
    ADD R4, R3, #1
    MUL R3, R4, -1
    STR R3, [R2, +#1]
    
    ADD R0, R0, #2
    B generate


sort_ascending:



scanint:
    MOV R4, LR              
    SUB SP, SP, #4          
    LDR R0, =num_str     
    MOV R1, SP              
    BL scanf                
    LDR R0, [SP]            
    ADD SP, SP, #4          
    MOV PC, R4  



.data


.balign 4
a:              .skip       80
b:              .skip       80
print_str:      .asciz      "array_a[%d] = %d, array_b = %d\n"
prompt_str:     .ascii      "Enter an integer.\n"
