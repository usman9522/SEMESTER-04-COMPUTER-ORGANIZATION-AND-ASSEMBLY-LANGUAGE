.model small
.stack 100h
.data 
    w db 'Enter a number between 0-9:$'
    var db '0'
.code
	main proc
		mov ax,@data
		mov ds,ax

                mov dx,offset w
		mov ah,09h
		int 21h

                mov ah,01h
                int 21h
                mov bh,al
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
         again: mov dl,var
                mov ah,02h
		int 21h
                inc var
                cmp var,bh
                ja exit
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
                
                jmp again
                
         exit:  mov ah,4ch
                int 21h


main endp
end main










