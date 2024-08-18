.model small
.stack 100h
.386
.data 
    str1 db 10,13,"Enter an decimal number: $"
    str2 db 10,13,"Number is Prime. $"
    str3 db 10,13,"Number is Not Prime. $"
    
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
        call check_prime
       
        
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
  

    check_prime proc 
       mov ax,var1
       cmp ax,1d
       je prime
       
       mov bx,2
       
ada:   mov ax,var1
       xor dx,dx
       div bx
       cmp var1,bx
       je prime
       
       cmp dl,0d
       je not_prime
       inc bx
       
       jmp ada
prime: lea dx,str2
        mov ah,9
        int 21h
        jmp below
       

not_prime: lea dx,str3
        mov ah,9
        int 21h
below: ret

    check_prime endp
end main