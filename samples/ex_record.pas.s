.intel_syntax noprefix
.text
.TopLevel_29:
.Constants_1:
.Constant_9:
    .quad 1
.Constant_12:
    .quad 3
.Constant_15:
    .quad 3
.Constant_18:
    .quad 3
.Constant_21:
    .quad 3
.Constant_24:
    .quad 1
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 16
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rbx
    push rbx
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 1
    lea rax, malloc[rip]
    call builtin$callsysv
    mov byte ptr [rax], 0
    mov qword ptr [r14], rax
    pop rbx
    push rbx
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 80
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_4:
    cmp qword ptr [rsp], 10
    je .ArrayInitializeLoopEnd_3
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov rdi, 16
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rbx
    push rbx
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 1
    lea rax, malloc[rip]
    call builtin$callsysv
    mov byte ptr [rax], 0
    mov qword ptr [r14], rax
    pop rbx
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_4
.ArrayInitializeLoopEnd_3:
    add rsp, 8
    pop rbx
    pop rbx
.Statement_5:
.Statement_6:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$reads
    add rsp, 8
    push r15
    add rsp, 8
.Statement_7:
    mov rax, .Constant_9[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_8:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$reads
    add rsp, 8
    push r15
    add rsp, 8
.Statement_10:
    mov rax, .Constant_12[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_11:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_13:
    mov rax, .Constant_15[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_14:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$reads
    add rsp, 8
    push r15
    add rsp, 8
.Statement_16:
    mov rax, .Constant_18[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_17:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$writesln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_19:
    mov rax, .Constant_21[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_20:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_22:
    mov rax, .Constant_24[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_23:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 10
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$writesln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_25:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$writesln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_26:
    nop
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    push qword ptr [r14]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    mov rax, 1
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    push qword ptr [r14]
    mov rbx, qword ptr [r14]
    push 0
.ArrayFinalizeLoop_28:
    cmp qword ptr [rsp], 10
    je .ArrayFinalizeLoopEnd_27
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    push rbx
    push qword ptr [r14]
    mov rbx, qword ptr [r14]
    mov rax, 0
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop qword ptr [r14]
    pop rbx
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayFinalizeLoop_28
.ArrayFinalizeLoopEnd_27:
    add rsp, 8
    pop qword ptr [r14]
    pop rbx
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop qword ptr [r14]
    pop rbx
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
