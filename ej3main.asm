

; mandar como parametro por stack a numToString:
; param1: numero
; param2: zona de memoria
section .text
GLOBAL _start
EXTERN numToString
EXTERN print

_start:
	; pusheo al stack el 124
	mov eax, 124
	; siempre para pushear necesito registros de 32bits (del tamaño del stack)
	push eax
	mov ebx, placeholder
	push ebx
	call numToString

	mov ebx, placeholder
	call	print 

	mov eax, 1
	mov ebx, 0
	int 80h
	
; poner data si es necesario
section .data

; por ahora nada aca
section .bss
placeholder resb 128

