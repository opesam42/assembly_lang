.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    array1 WORD 100h, 200h, 300h, 400h, 500h, 600h

.CODE
main PROC

    mov esi, OFFSET array1      
    mov ecx, LENGTHOF array1        ; set the size of the counter to the length of array1

    mov eax, 0                      ; clear accumulator
    
    L1:
        add ax, [esi]
        add esi, 2
        loop L1
    
    call DumpRegs
    exit

main ENDP
END main