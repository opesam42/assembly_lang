.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

.DATA
    str1 BYTE "Enter your name", 0
    str2 BYTE 'A', 'E', 'I', 'O', 'U'

.CODE
main PROC

    mov eax, 0  ;clean eax register
    mov al, str1    ; hold the first character as the string is seen as a array of characters

    mov edx, OFFSET str1    ;  Load the address into EDX ---
    
    call WriteString    ;call the print function

    call Crlf   ;print a new line

    call DumpRegs

    exit

main ENDP
END main