
ORG 0000H
    SJMP MAIN
MAIN:
    MOV C, /P2.0
    ANL C, P2.1
    MOV C, P2.1
    ANL C, /P2.0
    ORL C, P2.3
    MOV P2.6, C
    MOV C, P2.1
    ANL C, /P2.0
    MOV P2.7, C
    SJMP MAIN
END
