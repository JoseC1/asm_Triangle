;Goal of this assembly function is to make a program that ask for a size and prints a triangle 

%define userData ebp+8
section .data ;This is for inilizated data 
msg: db "+",0
newline: db "",10,0
section .bss ;THis is for uninitlized data 


section .text ;This is for the actuall assembly code 
extern printf ; Going to need this to print crap to the screen 
global asm_main ;Making our label of our main subprogram global 

asm_main:
;Creating a stack frame 
push ebp 
mov ebp, esp ;We are making ebp hold the OG position of the stack pointer 
pusha ; Preserving all the register values on the stack 

push DWORD[userData] ;This will be passed in as a parameter for printTriangle Function 
call printTriangle ; This will call the subprogram printTriangle 
add esp, 4 ; This will deallocate the parameter pushed into printTriangle function 


popa ; Restoring all the registers pushed on the stack 
;Destroying Stack frame
mov esp, ebp ;This moves esp to its original value essentially DEALLOCATING ALL MEMORY USED 
pop ebp ; Restoring our base pointer 
ret ;THis will jump to the next instruction address that called our function 


;Subprogram 
;void printTriangle(int size) 
;Stack of printTriangle 
;DWORD[ebp+8] = size (Parameter) 
printTriangle: 
;Setting up a stack frame for printTriangle 
push ebp 
mov ebp, esp 
pusha ; Preserving all the registers SINCE ITS A Void function 

;SUDO CODE 
;for (int row  = 0; row  < size; row ++)
;{ for (int col = 0; col <= row; col++)
;{printf("+");}
;printf("\n");}
XOR eax,eax ; eax = row = 0 
for_1:
cmp eax, DWORD[ebp+8] ; row - size 
jge done ; If eax is greater then or equal to we are done row >= size 
XOR ebx, ebx ; Zeroing out our column TO use in for_2 
for_2:
cmp ebx, eax ; col - row 
jg done_1 ; If col is > row jump to done_1 first for loop 
push eax ;Preserving its value
push ebx; Preserving its value
push msg ;Pushing the msg on to the stack 
call printf ;Printing the msg 
add esp, 4 ;Deallocating msg from stack 
pop ebx ;Restoring the ebx register 
pop eax ;Restoring the eax register 
inc ebx ;col++ 
jmp short for_2 ; Go back to second for loop 



done_1:
push eax; Preserving there values  
push newline ; Pushing the address of new line msg on the stack 
call printf ; Print a new line 
add esp, 4 ; Deallocating memory used by newline 
pop eax ; Getting back its value 
inc eax ; row++;
jmp short for_1 ; GO BACK TO The first for loop 

done:
popa ; Restoring all the registers since its a void function 
;Destorying stack frame 
mov esp, ebp 
pop ebp 
ret ; GO BACK 

