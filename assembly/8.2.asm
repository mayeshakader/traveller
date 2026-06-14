.MODEL SMALL
 .STACK 100H

 .DATA
   INPUT  DB  'ENTER SECONDS= $'
   RESULT DB  0DH,0AH,'THE  TIME IS (HOUR:MIN:SEC) = $'
   TIME DB  ' : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, INPUT             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     CALL READ_NUMBER                   

     PUSH AX                      ; STACK PUSH

     LEA DX, RESULT         
     MOV AH, 9
     INT 21H

     POP AX                       ; STACK POP

     XOR DX, DX                   ; CLEARING  DX
     MOV CX, 3600                 
     DIV CX                       ; AX=DX:AX\\CX , DX=DX:AX%CX

     CMP AX, 10                   ; COMPARING AX WITH 10
     JGE HOURS                    ; IF AX>=10

     PUSH AX                      ; STACK PUSH

     MOV AX, 0                    
     CALL DISPLAY                

     POP AX                       ;  STACK POP

     HOURS:                      
     CALL DISPLAY                  

     MOV AX, DX                   

     PUSH AX                      

     LEA DX, TIME          
     MOV AH, 9
     INT 21H

     POP AX                       ; STACK POP
     XOR DX, DX                   ; CLEARING DX

     MOV CX, 60                   ; set CX=60
     DIV CX                       ; set AX=DX:AX\\CX , DX=DX:AX%CX

     CMP AX, 10                   
     JGE MINUTES                  ; IF AX>=10

     PUSH AX                      ; push AX onto the STACK

     MOV AX, 0                    ; set AX=0
     CALL DISPLAY                  

     POP AX                       ; STACK POP

     MINUTES:                    
     CALL DISPLAY                 

     MOV BX, DX                   ; set BX=DX

     LEA DX, TIME          
     MOV AH, 9
     INT 21H

     MOV AX, BX                   

     CMP AX, 10                   
     JGE SECONDS                  ;  IF AX>=10

     PUSH AX                      ;STACK PUSH 

     MOV AX, 0                    ;AX=0
     CALL DISPLAY                  

     POP AX                       ; STACK POP

     SECONDS:                    
     CALL DISPLAY                  
     
    EXIT: 
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP



 



 READ_NUMBER PROC
   

   PUSH BX                        
   PUSH CX                        
   PUSH DX                        

   JMP READ                     

   SKIP_BACKSPACE:               
   MOV AH, 2                     
   MOV DL, 20H                    
   INT 21H                        

   READ:                         
   XOR BX, BX                     ; CLEARING BX
   XOR CX, CX                     ; CLEARING CX
   XOR DX, DX                     ; CLEARING DX

   MOV AH, 1                      
   INT 21H                        

   CMP AL, "-"                    
   JE @MINUS                     

   CMP AL, "+"                    
   JE @PLUS                       

   JMP SKIP_INPUT                

   @MINUS:                        
   MOV CH, 1                      
   INC CL                         
   JMP @INPUT                     

   @PLUS:                         
   MOV CH, 2                      
   INC CL                       

   @INPUT:                        ; jump label
     MOV AH, 1                    ; set input function
     INT 21H                      ; read a character

     SKIP_INPUT:                 ; jump label

     CMP AL, 0DH                  ; compare AL with CR
     JE JUMP_TO_END_INPUT        ; jump to label @JUMP_TO_END_INPUT

     CMP AL, 8H                   ; compare AL with 8H
     JNE NOT_BACKSPACE           ; jump to label @NOT_BACKSPACE if AL!=8

     CMP CH, 0                    ; compare CH with 0
     JNE @CHECK_REMOVE_MINUS      ; jump to label @CHECK_REMOVE_MINUS if CH!=0

     CMP CL, 0                    ; compare CL with 0
     JE SKIP_BACKSPACE           ; jump to label @SKIP_BACKSPACE if CL=0
     JMP @MOVE_BACK               ; jump to label @MOVE_BACK

     JUMP_TO_END_INPUT:          ; jump label

     JMP END_INPUT               ; jump to label @END_INPUT

     @CHECK_REMOVE_MINUS:         ; jump label

     CMP CH, 1                    ; compare CH with 1
     JNE @CHECK_REMOVE_PLUS       ; jump to label @CHECK_REMOVE_PLUS if CH!=1

     CMP CL, 1                    ; compare CL with 1
     JE @REMOVE_PLUS_MINUS        ; jump to label @REMOVE_PLUS_MINUS if CL=1

     @CHECK_REMOVE_PLUS:          ; jump label

     CMP CL, 1                    ; compare CL with 1
     JE @REMOVE_PLUS_MINUS        ; jump to label @REMOVE_PLUS_MINUS if CL=1
     JMP @MOVE_BACK               ; jump to label @MOVE_BACK

     @REMOVE_PLUS_MINUS:          
       MOV AH, 2                 
       MOV DL, 20H                
       INT 21H                    

       MOV DL, 8H                 ; DL=8H
       INT 21H                   

       JMP READ                  

     @MOVE_BACK:                  

     MOV AX, BX                   ;  AX=BX
     MOV BX, 10                   ; BX=10
     DIV BX                       ; AX=AX/BX

     MOV BX, AX                   ;  BX=AX

     MOV AH, 2                    
     MOV DL, 20H                  
     INT 21H                      

     MOV DL, 8H                   ; DL=8H
     INT 21H                      

     XOR DX, DX                   ; CLEARING DX
     DEC CL                       

     JMP @INPUT                   

     NOT_BACKSPACE:              

     INC CL                       

     CMP AL, 30H                  ; compare AL with 0
     JL ERROR                    ; IF AL<0

     CMP AL, 39H                  ; compare AL with 9
     JG ERROR                    ; IF AL>9

     AND AX, 000FH                ; ASCII TO DECIMAL

     PUSH AX                    

     MOV AX, 10                   ;  AX=10
     MUL BX                       ; AX=AX*BX
     MOV BX, AX                   ; BX=AX

     POP AX                      

     ADD BX, AX                   ;  BX=AX+BX
     JC ERROR
     
     
     CMP CL, 5
     JG ERROR  
   JMP @INPUT                     

   ERROR:                       

   MOV AH, 2                      
   MOV DL, 7H                     ;  DL=7H
   INT 21H                        

   XOR CH, CH                     ; CLEARING CH

   CLEAR:                       
     MOV DL, 8H                   ; DL=8H
     INT 21H                      

     MOV DL, 20H                  
     INT 21H                      

     MOV DL, 8H                   ; DL=8H
     INT 21H                      
   LOOP CLEAR                    ; IF CX!=0

   JMP READ                      

   END_INPUT:                   

   CMP CH, 1                       
   JNE @EXIT                      ; IF CH!=1
   NEG BX                         

   @EXIT:                         

   MOV AX, BX                     ; AX=BX

   POP DX                         
   POP CX                         
   POP BX                         

   RET                            ;RETURN
 READ_NUMBER ENDP


 


 DISPLAY PROC
 

   PUSH BX                       
   PUSH CX                        
   PUSH DX                        

   CMP AX, 0                      
   JGE START                     ;IF AX>=0

   PUSH AX                        

   MOV AH, 2                      
   MOV DL, "-"                    
   INT 21H                        

   POP AX                         

   NEG AX                         

   START:                        

   XOR CX, CX                     ; CLEARING CX
   MOV BX, 10                     ; set BX=10

   OUTPUT:                       
     XOR DX, DX                   ; CLEARING DX
     DIV BX                       ;  AX / BX
     PUSH DX                     
     INC CX                       
     OR AX, AX                    ; 
   JNE OUTPUT                    ; IF ZF=0

   MOV AH, 2                      

   PRINT:                      
     POP DX                       
     OR DL, 30H                   ; DECIMAL TO ASCII
     INT 21H                     
   LOOP PRINT                  ; IF CX!=0

   POP DX                         
   POP CX                        
   POP BX                         

   RET                            ; RETURN
 DISPLAY ENDP





 END MAIN