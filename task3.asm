
.MODEL SMALL
.STACK 100H

.DATA
    ARRAY1 DB 1,2,3,4,5,6,7,8
    ARRAY2 DB 2,4,6,8,1,3,5,7

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET ARRAY1
    MOV DI, OFFSET ARRAY2
    MOV CX, 8

COPY:
    MOV AL, [SI]
    MOV BL, [DI]
    MOV [SI], BL
    MOV [DI], AL
    INC SI
    INC DI

    DEC CX
    JNZ COPY

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
