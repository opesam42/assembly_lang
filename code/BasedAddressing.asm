.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    mystruct WORD 12
             DWORD 7000h
             BYTE 'M'

.CODE
main PROC
    ; this involve using the ebx register to find other element in the array

    mov ebx, OFFSET mystruct
    mov eax, [ebx+2]            ; hold 7000h
    call DumpRegs

    mov eax, 0
    mov eax, [ebx+6]            ; hold 'M'
    call DumpRegs

    exit


main ENDP
END main