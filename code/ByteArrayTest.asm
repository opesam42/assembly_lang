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

    ; 3. Mixed Types (Uninitialized, Decimal, Hex, Binary)
    list3 BYTE ?, 32, 41h, 00100010b

    ; 4. Mixed Formats (Hex, Hex, Char, Hex)
    list4 BYTE 0Ah, 20h, 'A', 22h

.CODE
main PROC

    ; --- Test 1: Read from list1 ---
    mov eax, 0          ; Clear EAX to look clean
    mov al, list1       ; Load first byte (10) into AL
    mov ah, [list1+1]   ; Load second byte (20) into AH
    call DumpRegs       ; Check EAX (Should see 140A = 20, 10 in hex)

    ; --- Test 2: Read from the "Middle" of list2 ---
    mov eax, 0
    mov al, [list2+4]   ; Skip first 4 bytes. Should get 50 (32h)
    mov ah, [list2+5]   ; Should get 60 (3Ch)
    call DumpRegs       ; Check EAX

    ; --- Test 3: Read the ASCII character from list4 ---
    mov eax, 0
    mov al, [list4+2]   ; Point to 'A' (65 decimal or 41h)
    call DumpRegs       ; EAX should end in 41

    exit
main ENDP
END main