.model small
.stack 100h
.386
.data
        s1ss db "Enter a string: $"
	s2ss db 10,13,"String is Palindrome. $"
        s3ss db 10,13,"String is not Palindrome. $"
	arr db 100 dup("$")
.code
main proc
	        mov ax, @data
		mov ds, ax

		lea dx, s1ss
		mov ah, 09h
		int 21h
                mov cx,0
                lea si,arr
                
   again:       mov ah,1
                int 21h
                cmp al,13
                je logic
               
                push ax
                mov [si],al
                inc si
                inc cx
                jmp again

    logic:      lea si,arr
     oper:      
                pop ax
                cmp al,[si]
                jne exit
                inc si
                dec cx
                jnz oper

                
               lea dx,s2ss
               mov ah, 09h
	       int 21h
               jmp exit_again
                
      exit:    

               lea dx,s3ss
               mov ah, 09h
	       int 21h
exit_again:               
mov ah,4ch
int 21h
main endp
end main    