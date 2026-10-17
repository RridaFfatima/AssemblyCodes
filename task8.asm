
.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 'Enter two digits: $'
    RESULT DB 13,10, 'Sum is $'
    ERROR DB 13,10,'Error! Sum is greater than 9.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    MOV DX, OFFSET MSG
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H

    ADD AL, BL

    CMP AL, 9
    JG OVERFLOW

    MOV BL, AL
    MOV AH, 09H
    MOV DX, OFFSET RESULT
    INT 21H

    MOV DL, BL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    JMP EXIT

OVERFLOW:
    MOV AH, 09H
    MOV DX, OFFSET ERROR
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN