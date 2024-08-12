.model small
.stack 100h
.data 
    w db 'Enter two digit: $'
    x db 'Enter operator: $'
    y db 'Sum is $'
    z db 'Difference is  $'
.code
	main proc
		mov ax,@data
		mov ds,ax
;integer input
                mov dx,offset w
		mov ah,09h
		int 21h

                mov ah,01h
                int 21h
                sub al,'0'
                mov bh,al
                
                
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
; operator input
                mov dx,offset x
		mov ah,09h
		int 21h
                mov ah,01h
                int 21h
                mov bl,al

                mov dl,10
		mov ah,2
		int 21h
		mov dl,13
		mov ah,2
		int 21h

;check operator
                cmp bl,43d
                je sum
                cmp bh,cl
                ja subb
                sub cl,bh
                mov dx,offset z
		mov ah,09h
		int 21h
                
                mov dl,cl
                add dl , '0'
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
         sum:   add bh,cl
                mov dx,offset y
		mov ah,09h
		int 21h
                
                mov dl,bh
                add dl , '0'
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
         subb:  sub bh,cl
                mov dx,offset z
		mov ah,09h
		int 21h
                
                mov dl,bh
                add dl , '0'
                mov ah,02h
                int 21h
                mov ah,4ch
                int 21h
main endp
end main               