.model small
.stack 100h
.data 
    w db 'Enter the string: $'
    x db 'Vowels are: $'
  
.code
	main proc
		mov ax,@data
		mov ds,ax
;take first input
                mov cl,'0'
                mov dx,offset w
		mov ah,09h
		int 21h
               
       again:   mov ah,01h
                int 21h
                cmp al,'a'
                jne e
                inc cl
              

            e:  cmp al,'e'
                jne i 
                inc cl
            
           i:   cmp al,'i'
                jne o 
                inc cl


          o:    cmp al,'o'
                jne u 
                inc cl
     
          u:    cmp al,'u'
                jne tooo
                inc cl

        tooo:   cmp al,13
                je exit
                
                jmp again
;new line                
       exit:    mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
                mov dx,offset x
		mov ah,09h
		int 21h

                mov dl,cl
                mov ah,02h
                int 21h
                mov ah , 4ch
                int 21h
               
              
main endp
end main

