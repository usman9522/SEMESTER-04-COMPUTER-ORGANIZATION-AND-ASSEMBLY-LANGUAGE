.model small
.stack 100h
.386
.data 
    w db 'Enter a binary number upto 16 digits (0,1): $'
    x db 'In HEXA it is:  $'
    y db 'Illegal binary digit, try again: $'
  
  
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
                mov cx,16
      again:    mov ah,1
                int 21h
                cmp al,13
                je logic
                cmp al,'0'
                je poi
     
                cmp al,'1'
                je poi
                jmp do

                
       poi:    sub al,'0'
              
      
                shl bx ,1
                or bl, al
                dec cx
                jnz again
  logic:       
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h
  
                mov dx, offset x
                mov ah,9
                int 21h
                mov cx,4
       re:      rol bx,4
                mov dl,bl
                and dl,0Fh
                cmp dl,9
                ja letter
                add dl,48
                jmp qwerty
      letter:   add dl,55
      qwerty:   mov ah,2
                int 21h

                dec cx
                jnz re
               

            
 exit:              
mov ah,4ch
int 21h

main endp
end main