.686
.MODEL flat, stdcall
.STACK 4096

ExitProcess PROTO :DWORD

.CODE
main PROC

    mov eax,10000h
    add eax,40000h
    sub eax,20000h

    push 0
    call ExitProcess

main ENDP
END main
