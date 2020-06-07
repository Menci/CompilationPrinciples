.intel_syntax noprefix
.text
.TopLevel_112:
.Constants_1:
.Constant_6:
    .quad 1
.Constant_10:
    .quad 6
.Constant_14:
    .quad 0
.Constant_19:
    .quad 1
.Constant_25:
    .quad 0
.Constant_29:
    .quad 0
.Constant_35:
    .quad 10
.Constant_39:
    .quad 1
.Constant_45:
    .quad 10
.Constant_54:
    .quad 1
.Constant_62:
    .quad 1
.Constant_66:
    .quad 0
.Constant_73:
    .quad 1
.Constant_75:
    .quad 0
.Constant_83:
    .quad 10
.Constant_88:
    .quad 1
.Constant_100:
    .quad 99999
.Function_3:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_4:
.Statement_5:
    mov rax, .Constant_6[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_7:
.BinaryOperatorLeftOperand_8:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_9:
    mov rax, .Constant_10[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setl al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_11
.Statement_12:
.Statement_13:
    mov rax, .Constant_14[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_15:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 5
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_16:
.BinaryOperatorLeftOperand_17:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_18:
    mov rax, .Constant_19[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_20:
    nop
    jmp .Statement_7
.NullStatement_11:
    nop
.Statement_21:
    nop
    leave
    ret
.Function_22:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_23:
.Statement_24:
    mov rax, .Constant_25[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_26:
.BinaryOperatorLeftOperand_27:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_28:
    mov rax, .Constant_29[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setne al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_30
.Statement_31:
.Statement_32:
.BinaryOperatorLeftOperand_33:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_34:
    mov rax, .Constant_35[rip]
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
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    cvttsd2si rax, qword ptr [rsp]
    mov qword ptr [rsp], rax
    pop qword ptr [r14]
.Statement_36:
.BinaryOperatorLeftOperand_37:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_38:
    mov rax, .Constant_39[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_40:
.BinaryOperatorLeftOperand_41:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_42:
.BinaryOperatorLeftOperand_43:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_44:
    mov rax, .Constant_45[rip]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    pop rsi
    sub qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_46:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 5
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_47:
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
.Statement_48:
    nop
    jmp .Statement_26
.NullStatement_30:
    nop
.Statement_49:
    nop
    leave
    ret
.Function_50:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_51:
.Statement_52:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_53:
    mov rax, .Constant_54[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_55:
.Statement_56:
.Statement_57:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_58:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 5
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_59:
.BinaryOperatorLeftOperand_60:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_61:
    mov rax, .Constant_62[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.BinaryOperatorLeftOperand_63:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_65:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 5
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
.BinaryOperatorRightOperand_64:
    mov rax, .Constant_66[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_55
.Statement_67:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_68:
    nop
    leave
    ret
.Function_69:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_70:
.Statement_71:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_72:
    mov rax, .Constant_73[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_74:
    mov rax, .Constant_75[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_76:
.Statement_77:
.Statement_78:
.BinaryOperatorLeftOperand_79:
.BinaryOperatorLeftOperand_81:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_82:
    mov rax, .Constant_83[rip]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_80:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_84:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 5
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_85:
.BinaryOperatorLeftOperand_86:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_87:
    mov rax, .Constant_88[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.BinaryOperatorLeftOperand_89:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_90:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_76
.Statement_91:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_92:
    nop
    leave
    ret
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 40
    mov rbx, rbp
    push rbx
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 40
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_94:
    cmp qword ptr [rsp], 5
    je .ArrayInitializeLoopEnd_93
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_94
.ArrayInitializeLoopEnd_93:
    add rsp, 8
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
.Statement_95:
.Statement_96:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_97:
.BinaryOperatorLeftOperand_98:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_99:
    mov rax, .Constant_100[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setle al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_109
.Statement_101:
.Statement_102:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_103:
    mov rbx, rbp
    push rbx
    call .Function_22
    add rsp, 8
    push r15
    add rsp, 8
.Statement_104:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_105:
    mov rbx, rbp
    push rbx
    call .Function_50
    add rsp, 8
    push r15
    add rsp, 8
.Statement_106:
    mov rbx, rbp
    push rbx
    call .Function_69
    add rsp, 8
    push r15
    add rsp, 8
.Statement_107:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_108:
    nop
    jmp .NullStatement_110
.Statement_109:
    nop
.NullStatement_110:
    nop
.Statement_111:
    nop
    mov rbx, rbp
    push rbx
    mov rax, -5
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
