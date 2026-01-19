; Checking out AND Operation

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    letter_a BYTE 01100001b                 ;letter 'a' repr in ASCII
    bitMask BYTE 11011111b                     ; mask for converting it to it corresponding uppercase

.CODE
main PROC

    ; clear register
    mov eax, 0
    mov edx, 0

    mov al, letter_a                    ; move the letter to be converted into dx
    mov dl, bitMask

    AND ax, dx

    call DumpRegs                       ; should give 41h, or 65d, or 01000001b
    exit
    

main ENDP
END main