.686
.MODEL flat, stdcall
.STACK
INCLUDE Irvine32.inc

ARRAY_SIZE = 5

.DATA
    intArray DWORD ARRAY_SIZE DUP(?)
    prompt1 BYTE "Enter a 32-bit number: "

.CODE
main PROC

    mov ecx, ARRAY_SIZE

    mov esi, OFFSET intArray
    L1:
        ; Print the prompt - Enter a number
        mov edx, OFFSET prompt1
        call WriteString

        ; allow user to enter input
        call ReadInt
        call Crlf

        mov [esi], eax
        
        add esi, 4              ; add 4 to move to the next index
        loop L1
    
    mov esi, OFFSET intArray    ; push esi to the start of the array
    mov eax, 0                  ; clear eax 
    mov eax, [esi+4]
    call DumpRegs
    exit

main ENDP
END main