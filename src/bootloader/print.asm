    [ORG 0x7C00]

print_newline:
    PUSH    ax
    MOV     ah, 0x0E
    MOV     al, `\r`
    INT     0x10
    MOV     al, `\n`
    INT     0x10
    POP     ax
    RET

print_str:
    PUSH    ax
    PUSH    bx

    MOV     ah, 0x0E

print_str_loop:
    CMP     byte[bx], 0
    JE      print_str_end

    MOV     al, byte[bx]
    INT     0x10

    INC     bx
    JMP     print_str_loop

print_str_end:
    POP     bx
    POP     ax
    RET

println_str:
    PUSH    ax
    PUSH    bx
    CALL    print_str
    CALL    print_newline
    POP     bx
    POP     ax
    RET

print_hex:
    PUSH    ax                      ;; Save the state of the registers we're gonna use
    PUSH    bx
    PUSH    cx

    MOV     ah, 0x0E                ;; Set the high byte of ax so INT knows which interrupt
    MOV     al, '0'                 ;; Move '0' into al
    INT     0x10                    ;; print the character in al
    MOV     al, 'x'
    INT     0x10

    MOV     cx, 4                   ;; Initialize the counter for 4 nibbles

print_hex_loop:                     ;; Main loop of the function
    CMP     cx, 0                   ;; If the counter is zero then we've printed 4 digits
    JE      print_hex_end

    PUSH    bx                      ;; Save the state of bx

    SHR     bx, 12                  ;; Shift right, equal to dividing

    CMP     bx, 10                  ;; If the number is greater than 10 we must 
    JGE     print_hex_alpha         ;; print a letter

    MOV     al, '0'                 ;; Start with zero and
    ADD     al, bl                  ;; add the current digit to get the correct character

    JMP     print_hex_loop_end

print_hex_alpha:                    ;; If the number is greater than 10 we need 
                                    ;; a different way of printing the digit
    SUB     bl, 10                  ;; Bring the number to a range of 0-5
    MOV     al, 'A'                 
    ADD     al, bl                  ;; Add that number to 'A' to get the correct
                                    ;; hexadecimal digit

print_hex_loop_end:

    INT     0x10                    ;; Print the character

    POP     bx                      ;; restore bx
    SHL     bx, 4                   ;; shift to the next 4 bits

    DEC     cx                      ;; decrement the counter

    JMP     print_hex_loop          ;; jump to the beginning of the loop

print_hex_end:
    CALL print_newline              ;; Print a newline

    POP     cx                      ;; Restore the state of the variables
    POP     bx
    POP     ax
    RET                             ;; Return from the function

print_hex_buf:
    TIMES   16 DB 0                 ;; Create a buffer of 16 zeros
