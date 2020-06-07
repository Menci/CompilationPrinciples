.intel_syntax noprefix
.text
.TopLevel_43:
.Constants_1:
.Constant_8:
    .quad 0
.Constant_38:
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
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_7:
    mov rax, .Constant_8[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setne al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_9
.Statement_10:
.Statement_11:
.BinaryOperatorLeftOperand_12:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_13:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    divsd xmm0, xmm1
    movq rax, xmm0
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    cvttsd2si rax, qword ptr [rsp]
    mov qword ptr [rsp], rax
    pop qword ptr [r14]
.Statement_14:
.BinaryOperatorLeftOperand_15:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_16:
.BinaryOperatorLeftOperand_17:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_18:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    pop rsi
    sub qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_19:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_20:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_21:
    nop
    jmp .Statement_5
.NullStatement_9:
    nop
.Statement_22:
    nop
    leave
    ret
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
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -3
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
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_26:
.BinaryOperatorLeftOperand_27:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_28:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setl al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_34
.Statement_29:
.Statement_30:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_31:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_32:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_33:
    nop
    jmp .NullStatement_35
.Statement_34:
    nop
.NullStatement_35:
    nop
.Statement_36:
.Statement_37:
    mov rax, .Constant_38[rip]
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_39:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_40:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_41:
    nop
.Statement_42:
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
