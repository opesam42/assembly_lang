.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

ARRAY_SIZE = 2

.DATA
    strPrompt BYTE "Enter a number - ", 0
    msgMax BYTE "The biggest number is ", 0

    intArray DWORD ARRAY_SIZE DUP(?)

.CODE
main PROC
    ; PromptForInteger starts
    mov ecx, ARRAY_SIZE
    mov esi, OFFSET intArray                    ; we are only comparing two integers
    call PromptForIntegers

    mov esi, OFFSET intArray   
    mov eax, [esi + 4]

    call DumpRegs
    ; PromptForInteger ends


    ; CheckForMax starts
    mov eax, 0                  ; clear eax
    mov esi, OFFSET intArray
    call CheckForMax

    call DumpRegs
    ; CheckForMax ends

    call DisplayMax

    exit
main ENDP


PromptForIntegers PROC
    push edx
    push eax

    L1:
        ; Print the "Enter a number"
        mov edx, OFFSET strPrompt
        call WriteString

        ; Read integer
        call ReadInt
        call Crlf

        ; store into array
        mov [esi], eax
        add esi, TYPE DWORD

        LOOP L1
    
    pop eax
    pop edx
    
    ret

PromptForIntegers ENDP


CheckForMax PROC

    mov eax, [esi]
    cmp eax, [esi + 4]

    jae done
    
    ;else
    mov eax, [esi + 4]          ; swap to let eax hold the maximum

    done:
        ret

CheckForMax ENDP


DisplayMax PROC
    push edx

    mov edx, OFFSET msgMax
    call WriteString
    
    call WriteInt               ; print number in the EAX

    pop edx
    ret
DisplayMax ENDP



END main