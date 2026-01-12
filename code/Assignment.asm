.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

; --- Constants ---
ARRAY_SIZE = 3             ; Change this to ask for more numbers (e.g., 5)

.DATA
    ; The Array to store the numbers (DWORD = 32-bit integer)
    intArray DWORD ARRAY_SIZE DUP(?)
    
    ; Strings for user interaction
    strPrompt BYTE "Enter a 32-bit signed integer: ", 0
    strResult BYTE "The sum of the array is: ", 0

.CODE
; ---------------------------------------------------------
; Main Procedure: The "Manager"
; It just calls the other procedures in order.
; ---------------------------------------------------------
main PROC
    call Clrscr             ; Clear screen for a fresh start

    ; Step 1: Prompt user for integers
    ; We pass the Array Address (ESI) and Count (ECX) to the procedure
    mov esi, OFFSET intArray
    mov ecx, ARRAY_SIZE
    call PromptForIntegers

    ; Step 2: Calculate the sum
    mov esi, OFFSET intArray
    mov ecx, ARRAY_SIZE
    call CalculateSum
    ; Result is now inside EAX

    ; Step 3: Display the sum
    call DisplaySum

    exit
main ENDP

; ---------------------------------------------------------
; Procedure 1: PromptForIntegers
; Asks the user to fill the array with numbers.
; Receives: ESI (Array Offset), ECX (Loop Counter)
; ---------------------------------------------------------
PromptForIntegers PROC
    ; Save registers used in this loop (Good practice!)
    push edx
    push eax
    
L1:
    ; Print "Enter integer..."
    mov edx, OFFSET strPrompt
    call WriteString
    
    ; Read the number
    call ReadInt            ; User input goes into EAX
    call Crlf               ; New line for neatness
    
    ; Store it in the array
    mov [esi], eax          ; Move number into memory at address ESI
    add esi, TYPE DWORD     ; Move pointer to next slot (add 4 bytes)
    
    loop L1                 ; Repeat ECX times

    pop eax
    pop edx
    ret
PromptForIntegers ENDP

; ---------------------------------------------------------
; Procedure 2: CalculateSum
; Loops through array and adds values to EAX.
; Receives: ESI (Array Offset), ECX (Loop Counter)
; Returns:  EAX (The Sum)
; ---------------------------------------------------------
CalculateSum PROC
    push esi                ; Keep ESI safe, we need to modify it
    mov eax, 0              ; Clear EAX (Accumulator) for the sum

L2:
    add eax, [esi]          ; Add the value in memory to EAX
    add esi, TYPE DWORD     ; Move to next number in array
    loop L2

    pop esi                 ; Restore ESI
    ret
CalculateSum ENDP

; ---------------------------------------------------------
; Procedure 3: DisplaySum
; Shows the result text and the number.
; Receives: EAX (The value to print)
; ---------------------------------------------------------
DisplaySum PROC
    push edx                ; Save EDX

    mov edx, OFFSET strResult
    call WriteString        ; Print "The sum is..."
    call WriteInt           ; Print the number in EAX
    call Crlf

    pop edx                 ; Restore EDX
    ret
DisplaySum ENDP

END main