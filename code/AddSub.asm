.686
.MODEL flat, stdcall    ; <--- PUT THIS BACK. It is required for .STACK to work.
.STACK 4096
INCLUDE Irvine32.inc

.CODE
main PROC

    mov eax, 10000h
    add eax, 40000h
    sub eax, 20000h

    call DumpRegs       ; Displays the registers
    
    exit

main ENDP
END main