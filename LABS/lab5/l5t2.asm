.model small
.stack 100h
.386
.data
        s1 db "Enter a string:$"
	s2 db "In reverse order:$"
	arr1 db 100 dup("$")
.code
main proc
	        mov ax, @data
		mov ds, ax

		lea dx, s1
		mov ah, 09h
		int 21h

		lea di,  arr1
again:		mov cx,0
dobara:  	xor ax,ax 
		mov ah, 01h
		int 21h	
		cmp al, ' '
		je oper
		cmp al, 13
		je write
		 
		push ax
		inc cx
		jmp dobara		 
		 

oper:		pop bx
		mov [di],bl
		inc di
		dec cx
		jnz oper
		mov ah,' '
		mov [di],ah
		inc di
		jmp again
aa:	
write:	        pop bx
		mov [di],bl
		inc di
		dec cx
		jnz aa
		 lea dx, s2
		 mov ah, 09h
		 int 21h
		 lea dx,  arr1
		 mov ah, 09h
		 int 21h
mov ah, 4ch
int 21h	     
main endp
end main	 