; Checking out AND Operation

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    byte1 BYTE 00111011b
    byte2 BYTE 00001111b

.CODE
main PROC

    ;-----------------------------
    ; CHECKING AND OPERATION
    ;-----------------------------

    ; clear register
    mov eax, 0
    mov edx, 0

    mov al, byte1
    mov dl, byte2

    AND al, dl

    call DumpRegs


    ;-----------------------------
    ; CHECKING OR OPERATION
    ;-----------------------------
    mov eax, 0
    mov edx, 0

    mov al, byte1
    mov dl, byte2

    OR al, dl

    call DumpRegs

    exit

main ENDP
END main