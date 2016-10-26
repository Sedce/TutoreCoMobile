TITLE LE03 (EXE)
.MODEL SMALL
.STACK 64
;----------------------------------------------------------
.DATA
NAME DB 'Cedez Marie$'
;----------------------------------------------------------
.CODE
MAIN PROC FAR
MOV AX, @data
MOV DS, AX
MOV ES, AX
MOV AH, 09H
LEA DX, NAME
INT 21H
MOV AX, 4C00H
INT 21H
MAIN ENDP
END MAIN
