.model small
.stack 100h
.386
.data 
    a db 'Enter an algebraic expression: $'
    b db 'Too many right brackets, Begin again. $'
    tt db 'Too many left brackets, Begin again. $'
    d db '"Expression is Correct" $'
    e db 'Type Y if you want to continue:  $'
    
   
.code
	main proc
		mov ax,@data
		mov ds,ax  
                jmp ali

        tere:   mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
        ali:    mov dx, offset a
		mov ah,09h
		int 21h
                

      again:    mov ah,01h
                int 21h
                cmp al,13
                je exit
                cmp al,28h
                je true
                cmp al,29h
                je here
                jmp again

       here:    pop bx
                cmp bl,28h
                je again
                jmp below
     
        true:   push ax
                jmp again
                
      below:    mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
                

                mov dx, offset b
		mov ah,09h
		int 21h
 
                
                jmp tere

      exit:     pop bx
                cmp bl,28h
                je under
                jmp neche
     under:     
                

                mov dx, offset tt
		mov ah,09h
		int 21h
 
                jmp tere

     neche:     mov dx, offset d
		mov ah,09h
		int 21h
               
                
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
                
                mov dx, offset e
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
                cmp al,'Y'
                je tere
mov ah,4ch
int 21h
main endp
end main
