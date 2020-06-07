.intel_syntax noprefix
.text
.TopLevel_26:
.Constants_1:
.Constant_13:
    .quad 0
.Constant_22:
    .quad 1
.Function_3:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov rbx, rbp
    push rbx
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_4:
.Statement_5:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_6:
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_7:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_8:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_9:
    mov rbx, rbp
    mov rax, 2
    lea r14, qword ptr [rbx + rax * 8]
    mov r14, qword ptr [r14]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 2
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 2
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_10:
.BinaryOperatorLeftOperand_11:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_12:
    mov rax, .Constant_13[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_15
.Statement_14:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop r14
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
    jmp .NullStatement_16
.Statement_15:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop r14
    push qword ptr [r14]
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.NullStatement_16:
    nop
.Statement_17:
    nop
    leave
    ret
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 48
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_19:
    cmp qword ptr [rsp], 6
    je .ArrayInitializeLoopEnd_18
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_19
.ArrayInitializeLoopEnd_18:
    add rsp, 8
    pop rbx
.Statement_20:
.Statement_21:
    mov rax, .Constant_22[rip]
    push rax
    pop rax
    test rax, rax
    jz .NullStatement_23
.Statement_24:
    mov rbx, rbp
    push rbx
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call .Function_3
    add rsp, 16
    push r15
    add rsp, 8
    jmp .Statement_21
.NullStatement_23:
    nop
.Statement_25:
    nop
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop rbx
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
