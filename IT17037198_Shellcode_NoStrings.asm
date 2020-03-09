section .text
  global _start   ; Needed for compiler, comparable to int main()
 

_start:
  xor eax,eax
  push eax
  push 'Me//' 
  push 'Open'    	; Push string 'OpenMe//' into stack
  mov ebx, esp		; load stack into ebx
  mov ecx, eax         	; no arguments in exc
  mov al, 39        	; eax = 39 mkdir, think of it like this mov [destination], [source]
  int 0x80        	; syscall

  xor eax,eax
  push eax
  push '.txt'
  push 'adMe'
  push '//Re'
  push 'Me//' 
  push 'Open'    	; Push string 'OpenMe/ReadMe.txt///' into stack
  mov ebx, esp    	; Load the string pointer into ebx
  mov ebx, esp		; load stack into ebx
  mov cx, 511    	; 511=-rwxr-xr-x permissions
  mov al, 8     	; eax = 8 creat, think of it like this mov [destination], [source]
  int 0x80        	; syscall

  xor eax,eax
  push eax
  push '.txt'
  push 'adMe'
  push '//Re'
  push 'Me//' 
  push 'Open'   	; Push string 'OpenMe/ReadMe.txt///' into stack
  mov ebx, esp		; load stack into ebx
  mov ecx, eax
  mov cl, 1      	; read-only (0), write-only (1), and read-write (2)
  mov al, 5     	; eax = 5 open, think of it like this mov [destination], [source]
  int 0x80        	; syscall
  mov ebx, eax    	; storing file descriptor of new file in ebx

  xor eax,eax
  push eax
  push '90  '
  push '0371'
  push 'IT17'
  push ' by '
  push 'cked'
  push 'n ha'
  push ' bee'
  push 'have' 
  push 'You '    	; Push string 'You have been hacked by IT17037198  ' into stack  
  mov ecx, esp		; load stack into ebx
  mov edx, eax
  mov dl, 36	 	; buffer size, no of bytes to write into edx
  mov al, 4     	; eax = 4 write, think of it like this mov [destination], [source]
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
