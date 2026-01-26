# Setup Instructions

This file provides setup instructions for the project in this folder.

## Prerequisites
- Windows OS
- PowerShell (default shell)
- MASM 32 

## Installing MASM32
1. [Download Here](http://www.masm32.com/download.htm) and select *Australia 1*. 
2. Add ```C:\masm32\bin``` to your System Path

## Steps [Let take AddSub.asm as an example]
1. Open PowerShell in this directory.
2. Assemble your `.asm` file using your assembler. Example for MASM:
   ```powershell
   ml /c /coff AddSub.asm
   ```
3. To create listing file
    ```powershell
   ml /c /coff /Fl AddSub.asm
   ```
3. Link the object file to create an executable:
   ```powershell
   C:\masm32\bin\link /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib AddSub.obj Irvine32.lib kernel32.lib user32.lib
   ```
4. Run the executable:
   ```powershell
   .\AddSub.exe
   ```

## Simple Steps
1. Run this batch command
   ```powershell
   .\make AddSub
   ```
   *No need to put to  extension*