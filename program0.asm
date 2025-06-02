; -- header --
bits 64
default rel
; -- variables --
section .bss
read_number resq 1 ; 64-bits integer = 8 bytes
; -- Constants --
section .data
read_format db "%d", 0 ; the format for scanf
string_literal_0 db "Hello, world",10,0
; -- Entry Point --
section .text
global main
extern ExitProcess
extern printf
extern scanf

main:
	PUSH rbp
	MOV rbp, rsp
	SUB rsp, 32
; -- Read --
	LEA rcx, read_format
	LEA rdx, read_format
	XOR eax, eax
	CALL scanf
	PUSH qword [read_number]
; -- Read --
	LEA rcx, read_format
	LEA rdx, read_format
	XOR eax, eax
	CALL scanf
	PUSH qword [read_number]
; -- ADD --
	POP rax
	ADD qword [rsp], rax
; -- Print --
	LEA rcx, string_literal_0
	XOR eax, eax
	CALL printf
; -- HALT --
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
CALL ExitProcess
