                            ;; I love programming in x86 assembly
                            ;;
                            ;; I think programming in x86 assembly is my
                            ;; second favorite thing in the entire world.
                            ;; My "roommate" is my first favorite thing in the
                            ;; world.

    [ORG 0x7C00]            ;; Where the BIOS expects the bootloader to be stored
                            ;; Addresses before this are reserved for other things
                            ;; Very suspicious if you ask me
    [BITS 16]

    KERNEL_OFFSET equ 0x1000 ;; Offset of the kernel from the bootloader I think

boot:
    MOV     bx, str
    CALL    println_str

hang:
    JMP     hang

str:
    DW      "Hello, World!", 0

    %INCLUDE "print.asm"

    TIMES   510-($-$$) DB 0
    DW      0xAA55          ;; The boot signature the BIOS looks for to see if 
                            ;; we can boot this code
