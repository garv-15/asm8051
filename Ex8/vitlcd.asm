ORG 0000H
MOV A, #38H   ; INITIALIZE 2x16 LCD
ACALL COMNWRT   ; call command subroutine
ACALL DELAY   ; give LCD some time
MOV A, #0EH   ; display on, cursor on
ACALL COMNWRT   ; call command subroutine
ACALL DELAY   ; give LCD some time
MOV A, #01   ; clear LCD
ACALL COMNWRT   ; call command subroutine
ACALL DELAY   ; give LCD some time
MOV A, #06H   ; shift cursor right
ACALL COMNWRT   ; call command subroutine
ACALL DELAY   ; give LCD some time
MOV A, #84H   ; cursor at line 1, pos. 4
ACALL COMNWRT   ;call command subroutine
ACALL DELAY     ; give LCD some time
MOV A, #'V'  ; display letter N
ACALL DATAWRT  ;call display subroutine
ACALL DELAY     ; give LCD some time
MOV A, #‘I'  ; display letter O
ACALL DATAWRT   ;call display subroutine
ACALL DELAY     ; give LCD some time
MOV A, #‘T'  ; display letter O
ACALL DATAWRT   ; call display subroutine
 
AGAIN:     SJMP AGAIN   ; stay here
COMNWRT:    ;send command to LCD
MOV P2,A  ; copy regA to port 1
CLR P3.7  ; RS=0 for command
CLR P3.6  ; R/W=0 for write
SETB P3.5  ; E=1 for high pulse
ACALL DELAY   ; give LCD some time
CLR P3.5  ; E=0 for H-to-L pulse
RET
DATAWRT:    ;write data to LCD
MOV P2,A  ; copyregA to port 1
SETB P3.7  ; RS=1 for data
CLR P3.6  ; R/W=0 for write
SETB P3.5  ; E=1 for high pulse
ACALL DELAY   ; give LCD some time
CLR P3.5  ; E=0 for H-to-L pulse
RET
 
DELAY:  MOV R3, #250  ; 50 or higher for fast CPUs
HERE2:  MOV R4, #255   ; R4 = 255
HERE:  DJNZ R4, HERE    ;stay until R4 becomes 0
    DJNZR3, HERE2  ; stay until R3 becomes 0
    RET
    END
