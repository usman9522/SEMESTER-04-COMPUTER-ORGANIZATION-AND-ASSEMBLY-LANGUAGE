.model small
.stack 100h
.386
.data 
    w db 'Enter character: $'
    x db 'ASCII code of $'
    y db ' in binary is: $'
    z db 'Count of 1 is: $'
    
   
.code
	main proc
		mov ax,@data
		mov ds,ax
;take first input
                mov dx, offset w
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
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
                
;logic          
                mov bh,'0'
                mov ch,8
       again:   shl bl,1
                jc aa
                mov dl,'0'
                mov ah,02
                int 21h
                jmp bb

          aa:   mov dl,'1'
                mov ah,02
                int 21h
                inc bh
          bb:   dec ch
                jnz again 

                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h 

                mov dx,offset z
		mov ah,09h
		int 21h      
              
                mov dl,bh
                mov ah,02
                int 21h

mov ah,4ch
int 21h
main endp
end main