.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    word1 WORD 60000            ;max value is 2^16
    dword1 DWORD 4000000000     ;max value is 2^32

.CODE
main PROC

    mov eax, 0
    mov eax, dword1

    call DumpRegs

    mov eax, 0
    mov ax, word1
    call DumpRegs

    exit

main ENDP
END main