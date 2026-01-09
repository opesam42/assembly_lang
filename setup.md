# Setup Instructions

This file provides setup instructions for the project in this folder.

## Prerequisites
- Windows OS
- PowerShell (default shell)
- An assembler (e.g., MASM, TASM, NASM) installed

## Steps
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

## Notes

---

✅ THE 3-STEP MASM WORKFLOW (ALWAYS THE SAME)

Every MASM program follows this exact pipeline:

ASM source  →  OBJ file  →  EXE program  →  Run it

Which corresponds to these 3 commands:

ml   →   link   →   run

Now let’s break down your exact commands one by one.

✅ STEP 1: ASSEMBLE THE PROGRAM
🔹 Command:
ml /c /coff AddSub.asm

✅ What this does:
Part	Meaning
ml	Runs the Microsoft Macro Assembler
/c	Compile only (do NOT link yet)
/coff	Output in COFF format (required by modern Windows linkers)
AddSub.asm	Your source file
✅ Input:
AddSub.asm   (your code)

✅ Output created:
AddSub.obj   ✅

❗ If you do NOT see AddSub.obj, then assembly failed.

✅ STEP 2: LINK THE PROGRAM (CREATE THE EXE)
🔹 Command:
link /SUBSYSTEM:CONSOLE AddSub.obj kernel32.lib msvcrt.lib

✅ What this does:
Part	Meaning
link	Runs the Windows linker
/SUBSYSTEM:CONSOLE	Tells Windows this is a console app
AddSub.obj	Your compiled object file
kernel32.lib	Windows core functions (ExitProcess, etc.)
msvcrt.lib	C runtime (for printf)
✅ Input:
AddSub.obj

✅ Output created:
AddSub.exe   ✅

❗ If you forget /SUBSYSTEM:CONSOLE, you get this error:

LNK1221: a subsystem can't be inferred

✅ STEP 3: RUN THE PROGRAM
🔹 Command:
AddSub

or

AddSub.exe

✅ What this does:

Windows loads your .exe

Executes your main procedure

Runs until ExitProcess

Returns control to CMD

✅ FULL BUILD & RUN FLOW (COPY–PASTE VERSION)

Whenever you want to build and run, just do:

ml /c /coff AddSub.asm
link /SUBSYSTEM:CONSOLE AddSub.obj kernel32.lib msvcrt.lib
AddSub

✅ ONE-LINE VERSION (FASTER)

You can also do everything in one shot:

ml /c /coff AddSub.asm && link /SUBSYSTEM:CONSOLE AddSub.obj kernel32.lib msvcrt.lib && AddSub

✅ WHAT EACH FILE MEANS

After building, your folder contains:

File	Purpose
AddSub.asm	Your source code
AddSub.obj	Machine code (not runnable)
AddSub.exe	✅ Final executable program

✅ COMMON ERRORS & WHAT THEY MEAN
❌ 'ml' is not recognized

✅ Fix: Path not loaded → restart VS Code or use full path

❌ LNK1221: subsystem can't be inferred

✅ Fix:

/SUBSYSTEM:CONSOLE

❌ Program runs but prints nothing

✅ That means:

You didn't include printf or Irvine

Or your program just calculates and exits

✅ YOUR CURRENT STATUS (EXCELLENT!)

Right now you:

✅ Installed MASM32
✅ Fixed PATH
✅ Assembled .asm → .obj
✅ Fixed linker subsystem
✅ Built .exe
✅ Ran program successfully

You are now working like a real low-level programmer 💪🔥
