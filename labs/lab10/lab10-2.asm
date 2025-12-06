%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0
pr db 'Как Вас зовут? ', 0
intr db 'Меня зовут ', 0

SECTION .bss
name resb 255

SECTION .text
global _start
_start:

mov eax, pr
call sprint

mov ecx, name
mov edx, 255
call sread

mov eax, 8
mov ebx, filename
mov ecx, 0644o
int 80h

mov esi, eax

mov eax, intr
call slen
mov edx, eax
mov ecx, intr
mov ebx, esi
mov eax, 4
int 80h

mov eax, name
call slen
mov edx, eax
mov ecx, name
mov ebx, esi
mov eax, 4
int 80h

mov ebx, esi
mov eax, 6
int 80h

call quit
