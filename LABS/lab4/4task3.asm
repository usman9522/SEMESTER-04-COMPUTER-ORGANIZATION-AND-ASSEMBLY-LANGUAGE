.model small
.stack 100h
.386
.data 
    w db 'Enter a hexa number (0-FFFF): $'
    x db 'In binary it is:  $'
    y db 'Illegal hex digit, try again: $'
    a db 100 ('$')
  
.code
	main proc
               
		mov ax,@data
		mov ds,ax
                
                mov dx, offset w
                mov ah,9
                int 21h
                jmp yy
        do:    
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h


               mov dx, offset y
                mov ah,9
                int 21h                
         yy:    xor bx,bx
               mov cx,4
      again:    mov ah,1
                int 21h
                cmp al,13
                je logic
                cmp al,30h
                jb do
     
                cmp al,5Ah
                ja do

                cmp al,'9'
                ja letter
                sub al,'0'
                jmp aa
      letter:   sub al,55 
         aa:    shl bx ,4
                or bl, al
                dec cx
                jnz again

                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h

       logic:   mov dx, offset x
                mov ah,9
                int 21h
                mov cx,16
       againn:  shl bx,1
                jc uu
                mov dl,'0'
                mov ah,02
                int 21h
                jmp bb

          uu:   mov dl,'1'
                mov ah,02
                int 21h
       
          bb:   dec cx
                jnz againn

            
               
mov ah,4ch
int 21h

main endp
end main