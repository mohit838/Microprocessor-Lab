        ;INTPUT TWO DIGIT
MOV AH,1   
INT 21H

SUB AL,'0'  
MOV CL,AL
     
MOV AH,01H  
INT 21H

SUB AL,'0'  

XCHG AL,CL
          
MOV AH,10    
MUL AH
ADD AL,CL

; F TO C 
;MUST BE ENTER F>>32 otherwise it shows up random values or something cause of negative values

SUB AL,32

MOV BH,5
MUL BH

MOV BH,9
DIV BH

;PRINT TWO DIGIT
MOV AH,0

MOV BH,10
DIV BH

MOV BL,AL
MOV CL,AH   ;REMAINDER 
 

MOV DL,BL
ADD DL,30H
MOV AH,2   
INT 21H

MOV DL,CL
ADD DL,30H
MOV AH,2   
INT 21H 



