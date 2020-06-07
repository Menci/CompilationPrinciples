.intel_syntax noprefix
.text
.TopLevel_44:
.Constants_1:
.Constant_9:
    .quad 0
.Constant_13:
    .quad 10
.Constant_17:
    .quad 0
.Constant_28:
    .quad 10
.Constant_32:
    .quad 1
.Constant_36:
    .quad 0
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 32
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
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_3:
.Statement_4:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_5:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_6:
.BinaryOperatorLeftOperand_7:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_8:
    mov rax, .Constant_9[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_40
.Statement_10:
.BinaryOperatorLeftOperand_11:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_12:
    mov rax, .Constant_13[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setl al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_38
.Statement_14:
.Statement_15:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_16:
    mov rax, .Constant_17[rip]
    push rax
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_18:
.Statement_19:
.Statement_20:
.BinaryOperatorLeftOperand_21:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_22:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_23:
.BinaryOperatorLeftOperand_24:
.BinaryOperatorLeftOperand_26:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_27:
    mov rax, .Constant_28[rip]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_25:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_29:
.BinaryOperatorLeftOperand_30:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_31:
    mov rax, .Constant_32[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_33:
    nop
.BinaryOperatorLeftOperand_34:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_35:
    mov rax, .Constant_36[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_18
.Statement_37:
    nop
    jmp .NullStatement_39
.Statement_38:
    nop
.NullStatement_39:
    nop
    jmp .NullStatement_41
.Statement_40:
    nop
.NullStatement_41:
    nop
.Statement_42:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_43:
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
