.model small
.stack 100h
.data 
    w db 'aaaa$'
.code
	main proc
		mov ax,@data
		mov ds,ax
		mov dx,offset w
		mov ah,09h
		int 21h
		mov ah,4ch
		int 21h
main endp
end main
