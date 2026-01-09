@echo off
cls
echo ----------------------------------------------
echo  Assembling and Linking: %1
echo ----------------------------------------------

REM 1. Assemble the code
C:\masm32\bin\ml /c /coff %1.asm
if errorlevel 1 goto :fail

REM 2. Link the object file (The long command you hate!)
C:\masm32\bin\link /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib %1.obj Irvine32.lib kernel32.lib user32.lib
if errorlevel 1 goto :fail

echo.
echo  [SUCCESS] Created %1.exe
echo ----------------------------------------------
echo.
echo  [RUNNING PROGRAM]
echo ----------------------------------------------
%1.exe
echo ----------------------------------------------
@REM goto :eof

:fail
echo.
echo  [ERROR] Build Failed!