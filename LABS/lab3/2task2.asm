.model small
.stack 100h
.data 
    w db 'Enter the first digit:$'
    x db 'Enter the second digit:$'
    y db 'Error! Sum is greater than 9$'
    z db 'The sum is $'
.code
	main proc
		mov ax,@data
		mov ds,ax
;take first input
                mov dx,offset w
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
                sub al,'0'
                mov bh,al
;new line                
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
;take second input                
                mov dx,offset x
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
                sub al,'0'
                mov cl,al
;new line      
                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h
;logic
                add bh,cl
                cmp bh,9

                ja exit
                mov dx,offset z
		mov ah,09h
		int 21h

                mov dl,bh
                add dl , '0'
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
                 
         exit:  mov dx,offset y
		mov ah,09h
		int 21h
                
                mov ah,4ch
                int 21h


main endp
end main
