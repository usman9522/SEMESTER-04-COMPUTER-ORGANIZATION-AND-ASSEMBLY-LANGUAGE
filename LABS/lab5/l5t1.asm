.model small
.stack 100h
.386
.data 
    w db 'Enter a binary number upto 8 digits (0,1): $'
    x db 'In HEXA it is:  $'
   
    arr db 5 dup ('$')
  
  
.code
	main proc
               
		mov ax,@data
		mov ds,ax
               
                mov cl,5
                lea di,arr
    udhr:       call binary_intput
               

                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h
                dec cl
                jnz udhr
                lea di,arr
                mov ch,5
   oper:        call hexa_output
               
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h
                dec ch
                jnz oper
                
                
                
               
               

            
     exit:      mov ah,4ch
                int 21h
                main endp 

  binary_intput proc
                mov dx, offset w
                mov ah,9
                int 21h

                xor bl,bl
                mov bh,8
      again:    mov ah,1
                int 21h
                cmp al,13
               
                je logic
                cmp al,'0'
                je poi
     
                cmp al,'1'
                je poi
               
                
       poi:     sub al,'0'
              
      
                shl bl ,1
                or bl, al
                dec bh
                jnz again
      logic:    
                mov [di],bl
                inc di
                ret
  
   binary_intput endp

   hexa_output proc

                mov dx, offset x
                mov ah,9
                int 21h
                mov bl,[di]
                mov bh,2
       re:      rol bl,4
                mov dl,bl
                and dl,0Fh
                cmp dl,9
                ja letter
                add dl,48
                jmp qwerty
      letter:   add dl,55
      qwerty:   mov ah,2
                int 21h

                dec bh
                jnz re
                inc di
                ret
  hexa_output endp 
 

end main