.686
.MODEL flat, stdcall
.STACK 4096
INCLUDE Irvine32.inc

.DATA
    ; 1. Simple Array (Decimal values)
    list1 BYTE 10, 20, 30, 40

    ; 2. Multi-line Array (All one big block of memory!)
    list2 BYTE 10, 20, 30, 40
          BYTE 50, 60, 70, 80
          BYTE 81, 82, 83, 84

    ; (Hex, Hex, Char, Hex)
    list4 BYTE 0Ah,  20h, 'A', 22h

.CODE
main PROC

    ; --- Test 1: Read from list1 ---
    mov eax, 0          ; Clear EAX to look clean
    mov al, list1       ; Load first byte (10) into AL
    mov ah, [list1+1]   ; Load second byte (20) into AH
    call DumpRegs       ; Check EAX (Should see 140A = 20, 10 in hex)

    ; ---Test 2: Read from list2 ---
    mov eax, 0
    mov al, [list2+4]
    mov ah, [list2+5]
    call DumpRegs

    ; --- Test3: Read char ---
    mov eax, 0
    mov al, [list4+2]   ; Load fourth byte (A) into AL. Should return 41h = 65 ASCII
    call DumpRegs

    exit
main ENDP
END main