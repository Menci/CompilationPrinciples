.intel_syntax noprefix
.text
.TopLevel_46:
.Constants_1:
.Constant_6:
    .quad 1
.Constant_13:
    .quad 2
.Constant_14:
    .quad 1
.Constant_20:
    .quad 1
.Constant_25:
    .quad 2
.Constant_26:
    .quad 1
.Constant_32:
    .quad 1
.Constant_37:
    .quad 2
.Constant_38:
    .quad 1
.Constant_44:
    .quad 4
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 24
    mov rbx, rbp
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
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_5:
    mov rax, .Constant_6[rip]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_8:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_7
.Statement_9:
.Statement_10:
.BinaryOperatorLeftOperand_11:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, .Constant_13[rip]
    push rax
    pop rcx
    pop rax
    cqo
    idiv rcx
    mov rax, rdx
    push rax
.BinaryOperatorRightOperand_12:
    mov rax, .Constant_14[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_27
.Statement_15:
.BinaryOperatorLeftOperand_16:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_17:
.BinaryOperatorLeftOperand_18:
    mov rax, .Constant_20[rip]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_19:
.BinaryOperatorLeftOperand_21:
.BinaryOperatorLeftOperand_23:
    mov rax, .Constant_25[rip]
    push rax
.BinaryOperatorRightOperand_24:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_22:
    mov rax, .Constant_26[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    divsd xmm0, xmm1
    movq rax, xmm0
    push rax
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    addsd xmm0, xmm1
    movq rax, xmm0
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    jmp .NullStatement_39
.Statement_27:
.BinaryOperatorLeftOperand_28:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_29:
.BinaryOperatorLeftOperand_30:
    mov rax, .Constant_32[rip]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_31:
.BinaryOperatorLeftOperand_33:
.BinaryOperatorLeftOperand_35:
    mov rax, .Constant_37[rip]
    push rax
.BinaryOperatorRightOperand_36:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_34:
    mov rax, .Constant_38[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    divsd xmm0, xmm1
    movq rax, xmm0
    push rax
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    subsd xmm0, xmm1
    movq rax, xmm0
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.NullStatement_39:
    nop
.Statement_40:
    nop
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_8
.ForLoopExit_7:
    add rsp, 8
.Statement_41:
.BinaryOperatorLeftOperand_42:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_43:
    mov rax, .Constant_44[rip]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
    pop rax
    movq xmm1, rax
    pop rax
    movq xmm0, rax
    mulsd xmm0, xmm1
    movq rax, xmm0
    push rax
    call builtin$writefln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_45:
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
