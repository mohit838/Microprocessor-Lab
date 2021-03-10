.MODEL SMALL
.STACK 100H

.DATA
	STRING_1 DB 'Enter first number: $'
	STRING_2 DB 'Enter second number: $' 
	STRING_3 DB 'Total_Sum: $'
	STRING_4 DB 'Double_digit_Sum: $'
	STRING_5 DB 'Single_digit_Sum: $'

.CODE
	MAIN PROC
		MOV AX, @DATA
		MOV DS, AX
		
		LEA DX, STRING_1
		MOV AH, 9
		INT 21H 
		
		;First number
		MOV AH,1   
        INT 21H
        SUB AL,'0'
        
        MOV BL,AL
        
		MOV AH,2
		MOV DL,0DH       
		INT 21H
		
		MOV DL,0AH
		INT 21H
		
		LEA DX, STRING_2
		MOV AH,9
		INT 21H
		
		;Second number
		MOV AH,1   
        INT 21H
        SUB AL,'0'   
        
        MOV CL,AL
		  
	
		;OPARATIONS
		ADD BL,CL
		 
		 
		 
		;CONDITIONS
		MOV AL,9
		CMP AL,BL
		JNG PRINT_1
		JG PRINT_2
		
		
		
		;IF CONDITION FALSE
		PRINT_1:
		MOV AH,2
		MOV DL,0DH       
		INT 21H
		
		MOV DL,0AH
		INT 21H
		
		LEA DX, STRING_5
		MOV AH,9
		INT 21H
		   
        MOV DL,BL
        ADD DL,30H
        MOV AH,2   
        INT 21H
        
        MOV AH, 4CH
		INT 21H
          
          
		;IF CONDITION TRUE  
		PRINT_2:
		MOV AH,2
		MOV DL,0DH       
		INT 21H
		
		MOV DL,0AH
		INT 21H
		      
		LEA DX, STRING_4
		MOV AH,9
		INT 21H
		      
		MOV AL,BL
		      
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
        
		MOV AH, 4CH
		INT 21H
	MAIN ENDP
END MAIN
