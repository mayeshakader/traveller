.MODEL SMALL
.STACK 100H

.DATA
    INPUT_PROMPT DB 0DH,0AH,'PLEASE ENTER AN ALGEBRAIC EQUATION: $'
    CORRECT_MSG DB 0DH,0AH,'EXPRESSION IS CORRECT.$'
    LEFT_BRACKET_ERROR_MSG DB 0DH,0AH,'TOO MANY LEFT BRACKETS.$'
    RIGHT_BRACKET_ERROR_MSG DB 0DH,0AH,'TOO MANY RIGHT BRACKETS.$'
    BRACKET_MISMATCH_MSG DB 0DH,0AH,'OPPS! BRACKET MISMATCH. TRY AGAIN.$'
    CONTINUE_PROMPT DB 0DH,0AH,'WANT TO CONTINUE? (Y/N): $'

.CODE
MAIN PROC
    MOV AX, @DATA                ; Initialize DS
    MOV DS, AX

    BEGIN:

    ; Print input prompt
    LEA DX, INPUT_PROMPT
    MOV AH, 9
    INT 21H

    XOR CX, CX                   ; Clear CX (bracket counter)

    MOV AH, 1                    ; Read character

    INPUT:
        INT 21H                  ; Read character

        CMP AL, 0DH               ; Compare AL with carriage return
        JE ENTER_PRESSED         ; If AL=CR, jump to ENTER_PRESSED

        CMP AL, "["               ; Compare AL with "["
        JE PUSH_BRACKET          ; If AL="[", jump to PUSH_BRACKET

        CMP AL, "{"               ; Compare AL with "{"
        JE PUSH_BRACKET          ; If AL="{", jump to PUSH_BRACKET

        CMP AL, "("               ; Compare AL with "("
        JE PUSH_BRACKET          ; If AL="(", jump to PUSH_BRACKET

        CMP AL, ")"               ; Compare AL with ")"
        JE FIRST_BRACKET         ; If AL=")", jump to FIRST_BRACKET

        CMP AL, "}"               ; Compare AL with "}"
        JE SECOND_BRACKET        ; If AL="}", jump to SECOND_BRACKET

        CMP AL, "]"               ; Compare AL with "]"
        JE THIRD_BRACKET         ; If AL="]", jump to THIRD_BRACKET

        JMP INPUT                 ; Continue looping

    PUSH_BRACKET:
        PUSH AX                  ; Stack push
        INC CX                   ; Increment bracket counter
        JMP INPUT                ; Continue looping

    FIRST_BRACKET:
        CMP SP, 100H             ; Check if stack is empty
        JE STACK_EMPTY           ; If stack is empty, jump to STACK_EMPTY

        POP DX                   ; Stack pop
        DEC CX                   ; Decrement bracket counter

        CMP CX, 0                ; Compare CX with 0
        JL RIGHT_BRACKET_ERROR   ; If CX < 0, jump to RIGHT_BRACKET_ERROR

        CMP DL, "("              ; Compare DL with "("
        JNE BRACKET_MISMATCH     ; If DL!="(", jump to BRACKET_MISMATCH
        JMP INPUT                ; Continue looping

    SECOND_BRACKET:
        CMP SP, 100H             ; Check if stack is empty
        JE STACK_EMPTY           ; If stack is empty, jump to STACK_EMPTY

        POP DX                   ; Stack pop
        DEC CX                   ; Decrement bracket counter

        CMP CX, 0                ; Compare CX with 0
        JL RIGHT_BRACKET_ERROR   ; If CX < 0, jump to RIGHT_BRACKET_ERROR

        CMP DL, "{"              ; Compare DL with "{"
        JNE BRACKET_MISMATCH     ; If DL!="{", jump to BRACKET_MISMATCH
        JMP INPUT                ; Continue looping

    THIRD_BRACKET:
        CMP SP, 100H             ; Check if stack is empty
        JE STACK_EMPTY           ; If stack is empty, jump to STACK_EMPTY

        POP DX                   ; Stack pop
        DEC CX                   ; Decrement bracket counter

        CMP CX, 0                ; Compare CX with 0
        JL RIGHT_BRACKET_ERROR   ; If CX < 0, jump to RIGHT_BRACKET_ERROR

        CMP DL, "["              ; Compare DL with "["
        JNE BRACKET_MISMATCH     ; If DL!="[", jump to BRACKET_MISMATCH

    JMP INPUT                    ; Continue looping

    STACK_EMPTY:
        LEA DX, RIGHT_BRACKET_ERROR_MSG
        MOV AH, 9
        INT 21H
        JMP BEGIN

    ENTER_PRESSED:
        CMP CX, 0                ; Compare CX with 0
        JNE LEFT_BRACKET_ERROR   ; If CX != 0, jump to LEFT_BRACKET_ERROR

        LEA DX, CORRECT_MSG
        MOV AH, 9
        INT 21H

        LEA DX, CONTINUE_PROMPT
        INT 21H

        MOV AH, 1
        INT 21H

        CMP AL, "Y"              ; Compare AL with "Y"
        JNE EXIT                 ; If AL!="Y", jump to EXIT
        JMP BEGIN                ; Jump to BEGIN

    BRACKET_MISMATCH:
        LEA DX, BRACKET_MISMATCH_MSG
        MOV AH, 9
        INT 21H
        JMP BEGIN

    LEFT_BRACKET_ERROR:
        LEA DX, LEFT_BRACKET_ERROR_MSG
        MOV AH, 9
        INT 21H
        JMP BEGIN

    RIGHT_BRACKET_ERROR:
        LEA DX, RIGHT_BRACKET_ERROR_MSG
        MOV AH, 9
        INT 21H

    JMP BEGIN

    EXIT:
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END MAIN
