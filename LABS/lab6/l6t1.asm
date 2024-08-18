.model small
.stack 100h
.386
.data 
    str1 db 10,13,"Enter Operand 1: $"
    str2 db 10,13,"Enter Operand 2: $"
    str3 db 10,13,"Enter Operator: $"
    str4 db 10,13,"Answer is: $"
   
    
    var1 dw ("$")
    var2 dw ("$")
    var3 db ("$")
    
     
    
.code
    main proc 
      mov ax,@data
      mov ds,ax

dobara:    mov dl,10
           mov ah,2
           int 21h
           mov dl,13
           mov ah,2
           int 21h

     lea dx,str1
      mov ah,9
      int 21h
      call decimal_input
     
      mov var1,bx
      cmp al,'x'
      je exi
      

      lea dx,str2
      mov ah,9
      int 21h
      call decimal_input
      mov var2,bx

      lea dx,str3
      mov ah,9
      int 21h
      mov ah,1
      int 21h
      mov var3,al

      cmp al,'+'
      je plus 
      cmp al,'-'
      je minus
      cmp al,'*'
      je mult
      cmp al,'%'
      je mode
      jmp exi

plus:  lea dx,str4
       mov ah,9
       int 21h
       xor ah,ah
       mov ax,var1
       mov bx,var2
       add ax,bx
       call decimal_output
       jmp dobara

minus: lea dx,str4
       mov ah,9
       int 21h
       xor ah,ah
       mov ax,var1
       mov bx,var2
       sub ax,bx
       call decimal_output
       jmp dobara

mult:  lea dx,str4
       mov ah,9
       int 21h
       mov ax,var1
       mov bx,var2
       xor dx,dx
       mul bx
       call decimal_output
       jmp dobara

mode:   lea dx,str4
       mov ah,9
       int 21h
       mov ax,var1
       mov bx,var2
       xor dx,dx
       div bx
       mov ax,dx
       call decimal_output 
       jmp dobara


      
      
exi:
    mov ah,4ch
    int 21h
    main endp

    decimal_input proc
      
      

       mov bx,0
ag:    mov ah,1
       int 21h
       
       cmp al,13
       je exit
       cmp al,'x'
       je exit
       sub al,48
       mov cl,al
       mov ch,0
       mov ax,bx
       mov bx,10
       mul bx
       add ax,cx
       mov bx,ax
       jmp ag
exit:  ret
   
    decimal_input endp


    
    decimal_output proc
 
    
       mov cx,0
again: cmp ax,0
       je print
       mov bx,10
       mov dx,0
       div bx
       push dx
       inc cx
       jmp again
print: pop dx
       cmp dx,9
       ja letter
       add dl,48
       jmp aa
letter: add dl,55
 aa:      mov ah,2
       int 21h 
       dec cx
       jnz print
       
       ret

    decimal_output endp
end main