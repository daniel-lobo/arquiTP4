section .text
GLOBAL copy

copy: 
	pushad ; doing backup
	cmp cx,	0
	jz .exit

	; copio de a 1 byte
.transfer:
	; copia a donde apunta ax
	mov dl, [eax]
	mov [ebx], dl
	dec cx
	jnz .transfer

.exit:
	popad ; return the stack as it was before calling copy
	mov eax,	0
	ret

	
