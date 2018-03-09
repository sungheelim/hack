global main


section .data
data: db "ABC", 10, 0x00

section .bss
dest: times 100 db 0x00

section .text
main:
    mov rdi, [dest]
    mov rsi, [data]
    mov rdx, 3
    call strncpy
    ret 

strncpy:
    mov rcx, rsi
routine:
    mov rbx, rdx
    sub rbx, rcx
    cmp rbx, rdx;rdx=3
    je end
    
    
    ; mov rdi, byte[rcx]
    mov al, byte[rcx]
    or al, al;null 인지 아닌지 확인
    jz end
    mov byte[rdi], al


    inc rcx
    inc rdi
    jmp routine
end:
    ret
