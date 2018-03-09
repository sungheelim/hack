global main


section .data
padding_data: db 0x90
length: dd 100

section .bss
dest: times 100 db 0x00;알아서 위치 잡아서, 100바이트 할당해줌

section .text
main:
    mov rdi, [dest]
    mov al, byte[padding_data];딱 0x90값만 가져오게!
    mov rsi, al
    mov rbx, [length]
    call memset
    ret 

memset:
    mov rcx, rdi
routine:
    push rdx
    mov rdx, rcx;rcx-rdi
    sub rdx, rdi;rcx-rdi
    cmp rbx, rdx;길이가 rdx
    je end
    pop rdx

    mov byte[rcx], rsi;중요!
    inc rcx
    jmp routine
end:
    ret
