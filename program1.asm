; -- header --
bits 64
default rel
; -- variables --
section .bss
read_number resq 1 ; 64-bits integer = 8 bytes
; -- Constants --
section .data
read_format db "%d", 0 ; the format for scanf
string_literal_0 db "not equal",10,0
string_literal_1 db "equal",10,0
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
; -- SUB --
	POP rax
	SUB qword [rsp], rax
; -- Jump.EQ.0 --
	CMP qword [rsp], 0
	JE L1
; -- Print --
	LEA rcx, string_literal_0
	XOR eax, eax
	CALL printf
; -- HALT --
	JMP EXIT_LABEL
; -- Label --
L1:
; -- Print --
	LEA rcx, string_literal_1
	XOR eax, eax
	CALL printf
; -- HALT --
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
CALL ExitProcess
