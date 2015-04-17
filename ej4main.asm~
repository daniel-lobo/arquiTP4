section .text
EXTERN print
EXTERN numToString

GLOBAL _start

_start:
	mov eax, numero ; guardo el numero 4
	mov ecx, 0	 ; limpio la memoria

	.ciclo:
		add ecx, eax
		dec eax
		jnz .ciclo

	push ecx	; el resultado final lo pusheo para que numToString lo agarre
	push placeholder ; numToString me pide la posicion de memoria
	call numToString
	
	pop ebx ; saca lo que esta en placeholder y lo pone en ebx
	pop edx ; idem pero con el resultado final
	call print

	; return 0
	mov eax, 1
	mov ebx, 0
	int 80h	

section .data
	numero equ 71 ; max number supported -> 72 not supported in numToString

section .bss
	placeholder resb 130
