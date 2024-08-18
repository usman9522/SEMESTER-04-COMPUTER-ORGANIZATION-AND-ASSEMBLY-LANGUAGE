.model small
.stack 100h
.386
.data 
    str1 db 10,13,"Enter an decimal number: $"
    str2 db 10,13,"Reversed is: $"
    str4 db 50 dup ("$")
    
    var1 dw ("$")
    var2 dw ("$")
    var3 db ("$")
    
     
    
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
 
    mov ax,var1
       
      mov cx,0
again: cmp ax,0
       je print
       mov bx,10
       mov dx,0
       div bx
       add dl,48
       push ax
       mov ah,2
       int 21h
       pop ax
       jmp again
      
       
 print:    ret

    decimal_output endp


    
   
end main