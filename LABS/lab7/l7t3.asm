.model small
.stack 100h
.386
.data 
    str1 db 10,13,"Input String: $"
    str2 db "After Trim Start..... $"
    str3 db 10,13,"Modified String: $"
    
    input_string db 80 dup(?)
    
    
    var dw ("$")
 
     
    
.code
    main proc 
      mov ax,@data
      mov ds,ax
      mov es,ax

      call inpu

      
      lea dx,str2
      mov ah,9 
      int 21h
 
      


     
      
      mov bh,' '
      mov bl,'$'
     lea si,input_string
   
abo:  mov al,[si]
      cmp al,bh 
      jne neche
      mov [si],bl
      
      jmp belo
neche:jmp under
belo:inc si
      dec cx
      jnz abo
      
under:

      

      lea dx,str3
      mov ah,9 
      int 21h
 
      mov cx,var
      lea si,input_string
ab:   lodsb
      mov dl,al
      cmp dl,bl
      je thale
      mov ah,2
      int 21h
 thale:  dec cx
      jnz ab

 

below:

    mov ah,4ch
    int 21h
main endp

    inpu proc
      
       lea dx,str1
       mov ah,9 
       int 21h

       mov cx,0
       lea si,input_string
again: mov ah,1
       int 21h
       cmp al,13
       je exit
       mov [si],al
       inc si
       inc cx
       jmp again
      mov var,cx
       
exit:  ret       
    inpu endp

end main