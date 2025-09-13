ORG 0000H
  MOV DPTR, #MYCOM
C1:   CLR A
  MOVC A,@A+DPTR
  ACALL COMNWRT  
  ACALL DELAY  
  INC DPTR
  JZ SEND_DAT
  SJMP C1
SEND_DAT:
  MOV DPTR, #MYDATA
D1:  CLR A
  MOVC A,@A+DPTR
  ACALL DATAWRT  
  ACALL DELAY  
  INC DPTR
  JZ AGAIN
  SJMP D1
AGAIN:   SJMP AGAIN
COMNWRT:    ;send command to LCD
MOV P1, A   ; copy regA to P1
CLR P3.7  ; RS=0 for command
CLR P3.6  ; R/W=0 for write
SETB P3.5  ; E=1 for high pulse
ACALL DELAY   ; give LCD some time
CLR P3.5  ; E=0 for H-to-L pulse
RET
 
DATAWRT:    ;write data to LCD
MOV P1, A   ; copy regA to port 1
SETB P3.7  ; RS=1 for data
CLR P3.6  ; R/W=0 for write
SETB P3.5  ; E=1 for high pulse
ACALL DELAY   ; give LCD some time
CLR P3.5  ; E=0 for H-to-L pulse
RET
 
DELAY:     MOVR3, #250   ; 50 or higher for fast CPUs
HERE2:     MOVR4, #255   ; R4 = 255
HERE:   DJNZ R4, HERE    ; stay until R4 becomes 0
  DJNZ R3, HERE2
  RET
 
  ORG 300H
MYCOM:     DB38H, 0EH, 01, 06, 0C0H, 0   ; commands and null
MYDATA:   DB “VIT University”, 0
END
