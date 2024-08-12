.model small
.stack 100h
.386
.data 
    w db 'Enter first number: $'
    x db 'Illegal, enter again:  $'
    y db 'ENTER second number: $'
    z db 'SUM is: $'
  
  
.code
	main proc
               
		mov ax,@data
		mov ds,ax
                
                mov dx, offset w
                mov ah,9
                int 21h
                jmp yy
        enteragain:   
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h


                mov dx, offset x
                mov ah,9
                int 21h                
         yy:    xor bh,bh
                xor cx,cx
                mov cx,8
      again:    mov ah,1
                int 21h
                cmp al,13
                je secondn
                cmp al,'0'
                je poi
     
                cmp al,'1'
                je poi
                jmp enteragain

                
       poi:    sub al,'0'
              
      
                shl bh ,1
                or bh, al
                dec cx
                jnz again


               mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h



                
   secondn:     mov dx, offset y
                mov ah,9
                int 21h
               jmp ali
     usman:   
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h
                

                mov dx, offset x
                mov ah,9
                int 21h                
         ali:   xor bl,bl
                xor cx,cx
                mov cx,8
      bilal:     mov ah,1
                int 21h
                cmp al,13
                je logic
                cmp al,'0'
                je por
     
                cmp al,'1'
                je por
                jmp usman

                
       por:     sub al,'0'
              
      
                shl bl ,1
                or bl, al
                dec cx
                jnz bilal
   logic:
                mov dl,13
                mov ah,02
                int 21h
                mov dl,10
                mov ah,02
                int 21h

                mov dx, offset z
                mov ah,9
                int 21h   
                add bh,bl
               
                jc carryy

                
                jmp welcome
     carryy:    mov dl,'1'
                mov ah,2
                int 21h
    welcome:    xor ch,ch
                mov ch,8
       acha:    shl bh,1
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
                jnz acha 

                







exit:
mov ah,4ch
int 21h
main endp
end main
