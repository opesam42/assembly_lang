.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    var1 BYTE 20 DUP(0) ; 20 byte, all equal to zero
    var4 BYTE 10, 3 DUP(0), 20  ;5 bytes, 10, 0, 0, 0, 20

.CODE
main PROC

    mov eax, 0
    mov al, var4    ; load the first element 10
    mov ah, [var4+4]

    call DumpRegs
    exit

main ENDP
END main