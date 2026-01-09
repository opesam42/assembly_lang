.686
.MODEL flat, stdcall
.STACK

INCLUDE Irvine32.inc

.DATA
    menu BYTE "What do you want to have for breakfast?", 0dh, 0ah, 0dh, 0ah,
              "1. Rice and Beans", 0dh, 0ah,
              "2. Yam and Egg", 0dh, 0ah,
              "3. Semo and Egusi", 0

.CODE
main PROC

    mov edx, OFFSET menu

    call WriteString    ; print string
    call Crlf   ; print extra line

    exit

main ENDP

END main