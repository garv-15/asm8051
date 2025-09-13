org 0000h

; part 1: storing all the numbers in the memory or registers

mov 30h, #0ffh
mov 31h, #0ffh
mov 40h, #0ffh
mov 41h, #0ffh

; part 2: [step 1] low x low

mov a, 31h
mov b, 41h
mul ab ; product is of form "BA" B - (higher byte), A - (lower byte)
mov 52h, b
mov 53h, a

; part 3: [step 2] high x high

mov a, 30h
mov b, 40h
mul ab
mov 50h, b
mov 51h, a

; part 4: [step 3] low x high

mov a, 41h
mov b, 30h
mul ab
add a, 52h
mov 52h, a
mov a, b
addc a, 51h
mov 51h, a
mov a, 50h
addc a, 00h
mov 50h, a

; part 5: [step 4] high x low

mov a, 31h
mov b, 40h
mul ab
add a, 52h
mov 52h, a
mov a, b
addc a, 51h
mov 51h, a
mov a, 50h
addc a, 00h
mov 50h, a

end

