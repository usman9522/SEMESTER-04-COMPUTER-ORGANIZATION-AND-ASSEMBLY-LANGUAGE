.model small
.stack 100h
.386
.data 
    a db 's =  $'
    arr db 10  ('$')
    
    
   
.code
	main proc
		mov ax,@data
		mov ds,ax 
 
                lea dx,a
                mov ah,9
                int 21h 
                xor ax,ax
                xor bx,bx
                mov cl,0
  again:        mov ah,01h
                int 21h
                cmp al,13
                je logic
                pop bx
                push bx
                cmp bl,al
                je below
                
                push ax
                inc cl
                jmp again
         below: pop bx
                dec cl
                jmp again

               
                
                xor ch,ch
                mov ch,cl
      logic:    lea si,arr
       above:   pop ax
                mov [si],al
                inc si
                dec cl
                jnz above

                
               dec si

                 

;printing
          
   oper:    mov dl,[si]
	    cmp dl,'$'
            je exit
            mov ah,2
            int 21h
            dec si
            dec ch
            jnz oper
exit:
mov ah,4ch
int 21h
main endp
end main
    
             






  