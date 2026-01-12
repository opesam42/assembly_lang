.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    array DWORD 1000h, 2000h, 3000h

.CODE
main PROC

    ; TRANVERSING AN ARRAY
    
    mov esi, OFFSET array
    mov eax, [esi]
    call DumpRegs

    add esi, 4                  ;why 4? Because DWORD is 32 bits = 4 bytes 
                                ; if it was array of bytes (8bits) to tranvese the array we use add esi, 1 
    add eax, [esi]              ;add the the 0th indext to the 1st
    call DumpRegs

    add esi, 4
    add eax, [esi]
    call DumpRegs
   
    exit
    

main ENDP
END main