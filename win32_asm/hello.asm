;=======================================================
;  Hello world in Assembler for the Win32 architecture
;=======================================================
.586p               ;Enables assembly of all instructions (including privileged) for the Pentium processor.
.model flat,stdcall ;memory model
option casemap:none ;case sensitive
 
;PROTOTYPE for windows API functions
include     \masm32\include\kernel32.inc
include     \masm32\include\user32.inc
 
;LIB for windows API functions
includelib  \masm32\lib\user32.lib
includelib  \masm32\lib\kernel32.lib
 
;push text macro
pusht macro text
    local @@0
        call @@0
        db text, 0
    @@0:
endm
 
.code
START:
    xor eax, eax
    push eax                ;Exit code
    push eax                ;MB_OK
    pusht "Hello World!"    ;The dialog box title.
    push [esp]              ;The message to be displayed.
    push eax                ;the message box has no owner window.
    call MessageBoxA        ;Displays a message box
    call ExitProcess        ;Terminate program
   
end START
