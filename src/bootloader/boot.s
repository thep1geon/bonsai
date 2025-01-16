;; I love programming in x86 assembly


    [ORG 0x7C00]            ;; Where the BIOS expects the bootloader to be stored
                            ;; Addresses before this are reserved for other things
                            ;; Very suspicous if you ask me
    [BITS 16]

hang:
    MOV     bx, str
    CALl    print
    JMP     hang

print:
    PUSH    ax
    PUSH    bx

    MOV     ah, 0x0E

print_loop:
    CMP     byte[bx], 0
    JE      print_end

    MOV     al, byte[bx]
    INT     0x10

    INC     bx
    JMP     print_loop

print_end:
    POP     bx
    POP     ax
    RET

str: DB `Hello, World\r\n`, 0

    TIMES   510-($-$$) DB 0
    DW      0xAA55          ;; The boot signature the BIOS looks for to see if 
                            ;; we can boot
