.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.CODE
main PROC

    ;-------------------
    ; CMP Operator on same values
    ; Zero Flag equals 1 as the value are the same
    ; Carry Flag CF equals 0 as destination > source
    ; Note: values in registers is not altered
    ;-------------------

    mov eax, 0
    mov edx, 0

    mov eax, 10
    mov edx, 10

    CMP eax, edx

    call DumpRegs

    ;-------------------
    ; CMP Operator on different values
    ; Zero Flag ZF equals 0 as the value are different
    ; Carry Flag CF equals 0 as destination > source
    ; Note: values in registers is not altered
    ;-------------------
    mov eax, 0
    mov edx, 0

    mov eax, 10
    mov edx, 8

    CMP eax, edx

    call DumpRegs


    ;-------------------
    ; CMP Operator on different values
    ; Zero Flag ZF equals 0 as the value are different
    ; Carry Flag CF equals 1 as destination < source
    ; Note: values in registers is not altered
    ;-------------------
    mov eax, 0
    mov edx, 0

    mov eax, 8
    mov edx, 10

    CMP eax, edx

    call DumpRegs

    exit

main ENDP
END main