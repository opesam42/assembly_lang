.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    source BYTE "This is the source string", 0
    target BYTE SIZEOF source DUP(0)
    
    msg1 BYTE "The character at index 5 of target is: ", 0
    msg2 BYTE "The character at index 5 of source is: ", 0

.CODE
main PROC

    mov esi, 0
    mov ecx, SIZEOF source

    LI:
        mov al, source[esi]     ; assess the char from the source text
        mov target[esi], al     ; place it in the array initialize with 0
        inc esi                 ; move to the next index
        loop LI
    
    ; --- Print the line ---
    mov edx, OFFSET msg1
    call WriteString
    

    mov eax, 0
    movzx eax, [target+5]       ; should print 69h 'i'
    call WriteChar
    
    call Crlf

    call DumpRegs
    
    exit

main ENDP
END main