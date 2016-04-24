    .global main
    .func main
   
   
   
main:
    BL prompt
    BL scanint
    MOV R5, R0	
    
    
    
    BL print
    B   exit           
   
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


generate:


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
prompt_str:     .ascii      "Enter an integer.\n"
