section .text
	EXTERN copy
	GLOBAL _start
	
_start:
	mov eax,	cadena1
	mov ebx,	placeholder
	mov cx, 	longitud
	
	call copy
	mov ecx, placeholder
	mov edx, longitud
	call print

	; finish the program
	mov eax, 1
	mov ebx, 0
	int 80h

print:
	mov eax,	 4
	mov ebx,	 1
	int 80h
	
section .data
	cadena1 db "Hola", 0
	longitud equ $-cadena1
	
section .bss
	placeholder resb 256

