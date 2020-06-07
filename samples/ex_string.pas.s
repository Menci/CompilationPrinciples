.intel_syntax noprefix
.text
.TopLevel_22:
.Constants_1:
.Constant_8:
    .quad 0
.Constant_11:
    .quad 1
.Constant_19:
    .quad 1
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 1
    lea rax, malloc[rip]
    call builtin$callsysv
    mov byte ptr [rax], 0
    mov qword ptr [r14], rax
    pop rbx
    push rbx
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 1
    lea rax, malloc[rip]
    call builtin$callsysv
    mov byte ptr [rax], 0
    mov qword ptr [r14], rax
    pop rbx
    push rbx
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_3:
.Statement_4:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$readsln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_5:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$strlen
    add rsp, 8
    push r15
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_6:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    mov rdi, qword ptr [rsp]
    lea rax, strlen[rip]
    call builtin$callsysv
    mov rdi, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov qword ptr [r14], rax
    mov rdi, rax
    pop rsi
    lea rax, strcpy[rip]
    call builtin$callsysv
.Statement_7:
    mov rax, .Constant_8[rip]
    push rax
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.BinaryOperatorLeftOperand_9:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_10:
    mov rax, .Constant_11[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
.ForLoop_13:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_12
.Statement_14:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorLeftOperand_15:
.BinaryOperatorLeftOperand_17:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_18:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
.BinaryOperatorRightOperand_16:
    mov rax, .Constant_19[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    call builtin$getchr
    add rsp, 16
    push r15
    call builtin$setchr
    add rsp, 24
    push r15
    add rsp, 8
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_13
.ForLoopExit_12:
    add rsp, 8
.Statement_20:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writesln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_21:
    nop
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop rbx
    push rbx
    mov rax, -2
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
