    .global main
    .func main
 
 
main:
     BL prompt
     BL scanfloat
     VLDR S0, [R0]

     @BL scanchar
     @MOV R6, R0

     @BL scanfloat
     @VLDR S1, [R0] 
     
    @ BL function 
     @VADD.F32 S2, S0, S1

     VCVT.F64.F32 D4, S0 
     VMOV R1, R2, D4
     BL print
     B exit

exit:
    MOV R7, #1
    SWI 0
    
prompt:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #58
    LDR R1, =prompt_str
    SWI 0
    MOV PC, LR

sum:
    MOV R5, LR
    VADD.F32 S2, S0, S1
    MOV PC, R5
    
difference:
    MOV R5, LR
    VSUB.F32 S2, S0, S1
    MOV PC, R5

product:
    MOV R5, LR
    VMUL.F32 S2, S0, S1      
    MOV PC, R5
max:
    MOV R5, LR
    VMOV S2, S1
    VCMP.F32 S0, S2
    VMOVGE S2, S0
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

scanfloat:
    MOV R4, LR              
    LDR R0, =num_str     
    BL scanf                
    @LDR R0, [R0]            
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

num_str:        .ascii      "%f"
op_str:         .ascii      " "
prompt_str:     .ascii      "Enter in order: a float, an operation, and another float.\n"
sol_str:        .asciz      "= %f \n"
