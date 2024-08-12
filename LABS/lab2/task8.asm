.model small
.stack 100h
.data 
.code
main proc
    mov ax,@data
	mov ds,ax
	mov dl,'?'
	mov ah,02h
	int 21h
	
	mov ah,01h
	int 21h
	mov cl,al
	
	mov ah,01h
	int 21h
        mov ch,al

	mov dl,10
	mov ah,2
	int 21h
	mov dl,13
	mov ah,2
	int 21h
	
	
	cmp cl,ch
	ja aa
	mov dl,cl
	mov ah,02h
	int 21h
	
	
	
	mov dl,ch
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
    
aa: mov dl,ch
	mov ah,02h
	int 21h
	
	
	
	mov dl,cl
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
	
main endp
end main	
