ORG 0000H
MOV A, #23H
MOV B, #0D5
MUL AB           ; A * B → result in A (low byte), B (high byte)
END
