.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.CODE
main PROC

    mov eax, 6
    mov ecx, 4  ; set counter to 4, 

    L1:
        add eax, ecx    ; at each loop add the value of ecx to eax - result should be 16
        loop L1
        ;loops stop when ecx is at 0, because ecx decreases

    call DumpRegs
    exit    

main ENDP
END main