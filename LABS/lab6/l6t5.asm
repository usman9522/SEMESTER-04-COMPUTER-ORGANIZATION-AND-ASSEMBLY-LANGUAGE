.model small
.stack 100h
.386
.data 
    str1 db 10,13,"Enter numerator of first fraction: $"
    str2 db 10,13,"Enter denominator of first fraction: $"
    str3 db 10,13,"Enter numerator of second fraction: $"
    str4 db 10,13,"Enter denominaor of seconf fraction: $"
    str5 db 10,13,"The result is: $"
    
    var1 dw ("$")
    var2 dw ("$")
    var3 dw ("$")
    var4 dw ("$")
    
     
    
.code
    main proc 
      mov ax,@data
      mov ds,ax
        lea dx,str1
        mov ah,9
        int 21h   
        call decimal_input
       mov var1,bx
   
         lea dx,str2
        mov ah,9
        int 21h   
        call decimal_input
       mov var2,bx

      lea dx,str3
        mov ah,9
        int 21h   
        call decimal_input
        mov var3,bx
   
         lea dx,str4
        mov ah,9
        int 21h   
        call decimal_input
        mov var4,bx

       mov ax,var2
       mov bx,var4
       mul bx
       push ax
       mov ax,var2
       mov bx,var3
       mul bx
       push ax
       mov ax,var1
       mov bx,var4
       mul ax
       push ax
       pop ax
       pop bx
       add ax,bx
       push ax
       lea dx,str5
       mov ah,9
       int 21h  
       
       pop ax 
       call decimal_output
      mov dl,'/'
       mov ah,2
       int 21h
       pop ax
       call decimal_output
   


      
       
 
        
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