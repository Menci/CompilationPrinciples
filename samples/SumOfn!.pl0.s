.intel_syntax noprefix
.text
.TopLevel_53:
.Constants_1:
.Constant_8:
    .quad 0
.Constant_16:
    .quad 1
.Constant_25:
    .quad 0
.Constant_29:
    .quad 0
.Constant_34:
    .quad 1
.Constant_39:
    .quad 20
.Constant_49:
    .quad 1
.Function_3:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_4:
.Statement_5:
.BinaryOperatorLeftOperand_6:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_7:
    mov rax, .Constant_8[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_19
.Statement_9:
.Statement_10:
.BinaryOperatorLeftOperand_11:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_12:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_13:
.BinaryOperatorLeftOperand_14:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_15:
    mov rax, .Constant_16[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_17:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_18:
    nop
    jmp .NullStatement_20
.Statement_19:
    nop
.NullStatement_20:
    nop
.Statement_21:
    nop
    leave
    ret
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov rbx, rbp
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -2
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
.Statement_22:
.Statement_23:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_24:
    mov rax, .Constant_25[rip]
    push rax
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_26:
.BinaryOperatorLeftOperand_27:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_28:
    mov rax, .Constant_29[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_30
.Statement_31:
.Statement_32:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_33:
    mov rax, .Constant_34[rip]
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_35:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_36:
.BinaryOperatorLeftOperand_37:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_38:
    mov rax, .Constant_39[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_41
.Statement_40:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
    jmp .NullStatement_42
.Statement_41:
    nop
.NullStatement_42:
    nop
.Statement_43:
.BinaryOperatorLeftOperand_44:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_45:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_46:
.BinaryOperatorLeftOperand_47:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_48:
    mov rax, .Constant_49[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_50:
    nop
    jmp .Statement_26
.NullStatement_30:
    nop
.Statement_51:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_52:
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
