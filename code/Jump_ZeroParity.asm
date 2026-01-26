; A program that jump to a particular action if their is zero parity

.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    msgEqual BYTE "The numbers are equal", 0
    msgNotEqual BYTE "The numbers are not equal", 0

.CODE
main PROC

    ;-------------------
    ; CMP Operator on same values
    ;-------------------

    mov eax, 0
    mov edx, 0

    mov eax, 10
    mov edx, 9

    CMP eax, edx
    call DumpRegs
    jz areEqual

    ; else stmt. start
    mov edx, OFFSET msgNotEqual
    call WriteString
    ; else stmt. end

    Jmp QuitProgram             ; irrespectuve this is runned

    call DumpRegs

    
    areEqual:
        mov edx, OFFSET msgEqual
        call WriteString

    QuitProgram:
        call Crlf
        exit

main ENDP
END main