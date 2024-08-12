.model small
.stack 100h
.data 
.code
main proc
	mov ax,@data
	mov ds,ax
	mov ah,01h
	int 21h
	xor al,00100000b
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
main endp
end main