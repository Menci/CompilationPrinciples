.intel_syntax noprefix
.text
.TopLevel_29:
.Constants_1:
.Constant_7:
    .quad 1
.Constant_14:
    .quad 1
.Constant_18:
    .quad 1
.Function_3:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_4:
.BinaryOperatorLeftOperand_5:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_6:
    mov rax, .Constant_7[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_21
.Statement_8:
.Statement_9:
.BinaryOperatorLeftOperand_10:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_11:
.BinaryOperatorLeftOperand_12:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_13:
    mov rax, .Constant_14[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_15:
.BinaryOperatorLeftOperand_16:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_17:
    mov rax, .Constant_18[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_19:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_20:
    nop
    jmp .NullStatement_22
.Statement_21:
    nop
.NullStatement_22:
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
.Statement_23:
.Statement_24:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_25:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_26:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_27:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_28:
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
