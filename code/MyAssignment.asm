.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

ARRAY_SIZE = 5

.DATA
    intArray DWORD ARRAY_SIZE DUP(?)

    prompt1 BYTE "Enter a 32-bit number: ", 0

    msg1 BYTE "The sum of the array is: ", 0


.CODE
main PROC
    
    mov esi, OFFSET intArray
    mov ecx, ARRAY_SIZE
    call PromptForIntegers

    mov esi, OFFSET intArray        ; reset the index to 0
    mov ecx, ARRAY_SIZE
    call CalculateSum               ; The sum is stored in EAX

    call DisplaySum                 ; Display the result

    call DumpRegs
    exit

main ENDP


PromptForIntegers PROC

    push eax
    push edx
    ; mov ecx, ARRAY_SIZE

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
    
    pop edx
    pop eax
    ret

PromptForIntegers ENDP


CalculateSum PROC

    push esi
    mov eax, 0

    L2:
        add eax, [esi]
        add esi, 4
        loop L2

    pop esi
    ret

CalculateSum ENDP


DisplaySum PROC

    push edx

    mov edx, OFFSET msg1
    call WriteString
    call WriteInt           ; Print the number in EAX
    call Crlf
    
    pop edx
    ret

DisplaySum ENDP

END main