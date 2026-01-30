bits 32
global memspace
%define slotCount (1024*1024*1024/4)

Section .data alloc noexec write progbits
    memspace:
        dd _memspace

Section .space alloc noexec write nobits
    _memspace:
        slotC equ slotCount
        resd slotC

Section .note.GNU-stack noalloc
