.MODEL SMALL
.STACK 100H

.DATA
    MAX_STRING_LENGTH EQU 80
    STRING            DB MAX_STRING_LENGTH+2 DUP('$') ; Buffer for the input string
    POSITION_STR      DB 5 DUP('$') ; Buffer for the position input
    BYTES_TO_REMOVE   DB 5 DUP('$') ; Buffer for the number of bytes to remove input
    RESULT_STRING     DB MAX_STRING_LENGTH+2 DUP('$') ; Buffer for the resulting string
    NEWLINE           DB 0DH, 0AH, '$' ; Newline characters for formatting

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Read the input string
    LEA DX, STRING
    MOV AH, 0AH
    INT 21H

    ; Read the position
    LEA DX, POSITION_STR
    MOV AH, 0AH
    INT 21H

    ; Convert the position string to an integer
    MOV SI, OFFSET POSITION_STR+2
    CALL STR2INT
    MOV CX, AX ; CX now contains the position

    ; Read the number of bytes to remove
    LEA DX, BYTES_TO_REMOVE
    MOV AH, 0AH
    INT 21H

    ; Convert the bytes to remove string to an integer
    MOV SI, OFFSET BYTES_TO_REMOVE+2
    CALL STR2INT
    MOV DX, AX ; DX now contains the number of bytes to remove

    ; Call DELETE subroutine to remove N bytes at position S
    LEA SI, STRING+2 ; Skip the length byte in the input string
    LEA DI, RESULT_STRING+2 ; Skip the length byte in the result string
    MOV BX, CX ; BX contains the position
    MOV CX, DX ; CX contains the number of bytes to remove
    CALL DELETE

    ; Print the resulting string
    LEA DX, RESULT_STRING
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP

; Subroutine to convert a string to an integer
STR2INT PROC
    XOR AX, AX ; Clear AX to store the result
    MOV CX, 10 ; Set the divisor to 10 for decimal conversion

    STR2INT_LOOP:
        MOV AL, [SI] ; Load the next character from the string
        CMP AL, '$'  ; Check for the end of the string
        JE  STR2INT_DONE ; Exit the loop if end of string
        SUB AL, '0'   ; Convert ASCII character to integer ('0' -> 0, '1' -> 1, ..., '9' -> 9)
        MUL CX        ; Multiply the current result by 10
        ADD AX, AL    ; Add the new digit
        INC SI        ; Move to the next character in the string
        JMP STR2INT_LOOP ; Repeat the loop

    STR2INT_DONE:
        RET
STR2INT ENDP

; Subroutine to delete N bytes at position S in a string
DELETE PROC
    MOV DI, SI ; Set DI to the source position (S)
    ADD DI, BX ; Add the offset (position) to DI

    ; Move the remaining bytes to fill the gap
    MOV AX, DI
    ADD AX, CX ; Calculate the end position after removing N bytes
    MOV SI, AX ; Set SI to the end position

    DELETE_LOOP:
        LODSB ; Load the next byte from SI
        STOSB ; Store the byte at DI
        LOOP DELETE_LOOP ; Repeat for CX times

    RET
DELETE ENDP

END MAIN
