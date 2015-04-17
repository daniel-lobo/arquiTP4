; ej3
; agregar una funcion que recibe un numero y una zona de memoria
; transformar el numero a string, terminarlo en cero
; guardar en la zona de memoria que pasaron como parametro

section .text
GLOBAL numToString
GLOBAL print

numToString:
	mov ebx,	[esp+4]
	mov eax, 	[esp+8]
	mov ecx, 	0h
	mov edx,	0h
		
	.ciclo:
		mov dl, 0xA
		div dl
		mov dl, ah
		push edx
		inc ecx
		mov ah, 0h
		cmp ax, 0h
		jnz .ciclo
	
	.juntar:
		pop edx
		add edx, 30h
		mov [ebx], edx
		inc ebx
		dec ecx
		jnz .juntar
		mov dl, 0
		mov [ebx], edx
		ret

;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
