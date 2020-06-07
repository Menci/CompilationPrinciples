.intel_syntax noprefix
.text
.TopLevel_19:
.Constants_1:
.Constant_6:
    .quad 123
.Constant_8:
    .quad 456
.Constant_12:
    .quad 1
.Constant_14:
    .quad 2
.Function_3:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_4:
.Statement_5:
    mov rax, .Constant_6[rip]
    push rax
    mov rbx, rbp
    mov rax, 3
    lea r14, qword ptr [rbx + rax * 8]
    mov r14, qword ptr [r14]
    pop qword ptr [r14]
.Statement_7:
    mov rax, .Constant_8[rip]
    push rax
    mov rbx, rbp
    mov rax, 2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_9:
    nop
    leave
    ret
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_10:
.Statement_11:
    mov rax, .Constant_12[rip]
    push rax
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_13:
    mov rax, .Constant_14[rip]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_15:
    mov rbx, rbp
    push rbx
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_3
    add rsp, 24
    push r15
    add rsp, 8
.Statement_16:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_17:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_18:
    nop
    leave
    ret
.globl main
main:
    push rbp
    mov rbp, rsp
    call .Function_2
    xor rax, rax
    leave
    ret
