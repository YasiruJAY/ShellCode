section .data
  dirName db 'OpenMe', 0 ; db stands for define byte, msg will now be a string pointer.
  dirNameLen equ $ - dirName

  fileName db 'OpenMe/ReadMe.txt', 0 ; db stands for define byte, msg will now be a string pointer.
  fileNameLen equ $ - fileName

  line db 'You have been hacked by IT17037198', 0xa, 0 ; db stands for define byte, msg will now be a string pointer.
  lineLen equ $ - line

 
section .text
  global _start   ; Needed for compiler, comparable to int main()
 

_start:
  xor eax,eax
  mov al, 39         	; eax = 39 mkdir, think of it like this mov [destination], [source]
  mov ebx, dirName    	; Load the string pointer into ebx
  xor ecx, ecx         	; no arguments in exc
  int 0x80        	; syscall

  xor eax,eax
  mov al, 8     	; eax = 8 creat, think of it like this mov [destination], [source]
  mov ebx, fileName    	; Load the string pointer into ebx
  xor ecx, ecx
  mov cx, 511    	; 511=-rwxr-xr-x permissions
  int 0x80        	; syscall

  xor eax,eax
  mov al, 5     	; eax = 5 open, think of it like this mov [destination], [source]
  mov ebx, fileName    	; Load the string pointer into ebx
  xor ecx, ecx
  mov cl, 1      	; read-only (0), write-only (1), and read-write (2)
  int 0x80        	; syscall
  mov ebx, eax    	; storing file descriptor of new file in ebx

  xor eax,eax
  mov al, 4     	; eax = 4 write, think of it like this mov [destination], [source]
  mov ecx, line    	; Load the string pointer into ecx
  xor edx, edx
  mov dl, lineLen 	; buffer size, no of bytes to write into edx
  int 0x80        	; syscall

  xor eax,eax
  mov al, 36     	; eax = 36 sync, think of it like this mov [destination], [source]
  int 0x80        	; syscall

  xor eax,eax
  mov al, 6    		; eax = 6 close, think of it like this mov [destination], [source]
  int 0x80        	; syscall

  xor eax, eax      	; exit syscall
  mov al, 1
  xor ebx, ebx      	; no errors
  int 0x80        	; syscall
