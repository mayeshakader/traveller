.MODEL SMALL
.STACK 100H

.DATA
    INPUT_STRING  DB 255 DUP('$') ; Input buffer to store the entered string
    OUTPUT_STRING DB 255 DUP('$') ; Output buffer to store the converted string
    NEWLINE       DB 0DH, 0AH, '$' ; Newline characters for formatting

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Read a line of text
    LEA DX, INPUT_STRING
    MOV AH, 0AH
    INT 21H

    ; Convert lowercase letters to uppercase using XLAT
    LEA SI, INPUT_STRING+2 ; Skip the length byte
    LEA DI, OUTPUT_STRING

    CONVERT_LOOP:
        LODSB                ; Load a character from the source (SI) into AL
        CMP AL, 0DH          ; Check for carriage return
        JE  END_CONVERT_LOOP ; Exit the loop if carriage return is encountered
        CMP AL, 'a'
        JB  NOT_LOWER_CASE   ; If the character is not a lowercase letter, skip conversion
        CMP AL, 'z'
        JA  NOT_LOWER_CASE   ; If the character is not a lowercase letter, skip conversion
        SUB AL, 20H          ; Convert lowercase to uppercase by subtracting 20H
        NOT_LOWER_CASE:
        STOSB                ; Store the result in the destination (DI) and increment DI
        JMP CONVERT_LOOP

    END_CONVERT_LOOP:

    ; Print the original and converted strings
    LEA DX, INPUT_STRING+2 ; Skip the length byte
    MOV AH, 9
    INT 21H

    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H

    LEA DX, OUTPUT_STRING
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
