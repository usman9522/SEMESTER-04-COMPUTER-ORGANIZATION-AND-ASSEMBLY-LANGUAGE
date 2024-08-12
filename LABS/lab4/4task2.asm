.model small
.stack 100h
.386
.data 
    w db 'Enter character: $'
    x db 'ASCII code of $'
    y db ' in HEXA is: $'
    z db 'Count of 1 is: $'
    
   
.code
	main proc
		mov ax,@data
		mov ds,ax
;take first input
        ano :   mov dx, offset w
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
                cmp al,13
                je exit
                mov bl,al
                
                
;new line                
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
             
                mov dx,offset x
		mov ah,09h
		int 21h
            
                mov dl,bl
                mov ah,02
                int 21h
                
                mov dx,offset y
		mov ah,09h
		int 21h

     logic:     mov cx,2
        again:  rol bl,4
                mov dl,bl
                and dl,0Fh
                cmp dl,9
                ja letter
                add dl,48
                jmp aa
   letter:      add dl,55
         aa:    mov ah,2
                int 21h
                dec cx
                jnz again
                  mov dl,10
                mov ah,2
                int 21h
                mov dl,13
                mov ah,2
                int 21h
                jmp ano
exit:
mov ah,4ch
int 21h
main endp
end main
