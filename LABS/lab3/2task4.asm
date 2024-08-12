.model small
.stack 100h
.data 
    w db 'Enter the string: $'
    x db 'String in reverse: $'
    str1 db 100 ('$')
.code
	main proc
		mov ax,@data
		mov ds,ax
;take first input
                mov cl,0
                mov dx,offset w
		mov ah,09h
		int 21h
                mov si,offset str1
       again:   mov ah,01h
                int 21h
                cmp al,13
                je exit
                mov [si] , al
                inc si
                inc cl
                jmp again
;new line                
       exit:    mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h   
                dec si
            
               
                
                

         jj:    mov dl,[si]   
                mov ah,02h
                int 21h
                dec si
                dec cl
                jnz jj
                mov ah,4ch
                int 21h
main endp
end main

