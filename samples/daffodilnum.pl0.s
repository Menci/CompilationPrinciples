.intel_syntax noprefix
.text
.TopLevel_116:
.Constants_1:
.Constant_6:
    .quad 1
.Constant_10:
    .quad 4
.Constant_14:
    .quad 0
.Constant_19:
    .quad 1
.Constant_26:
    .quad 0
.Constant_30:
    .quad 0
.Constant_36:
    .quad 10
.Constant_40:
    .quad 1
.Constant_46:
    .quad 10
.Constant_64:
    .quad 1
.Constant_66:
    .quad 1
.Constant_68:
    .quad 1
.Constant_74:
    .quad 2
.Constant_76:
    .quad 2
.Constant_78:
    .quad 2
.Constant_84:
    .quad 3
.Constant_86:
    .quad 3
.Constant_88:
    .quad 3
.Constant_94:
    .quad 1
.Constant_98:
    .quad 1000
.Constant_113:
    .quad 1
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
    push 3
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
    sub rsp, 8
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_23:
.Statement_24:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_25:
    mov rax, .Constant_26[rip]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_27:
.BinaryOperatorLeftOperand_28:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_29:
    mov rax, .Constant_30[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setne al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_31
.Statement_32:
.Statement_33:
.BinaryOperatorLeftOperand_34:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_35:
    mov rax, .Constant_36[rip]
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
.Statement_37:
.BinaryOperatorLeftOperand_38:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_39:
    mov rax, .Constant_40[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_41:
.BinaryOperatorLeftOperand_42:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_43:
.BinaryOperatorLeftOperand_44:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_45:
    mov rax, .Constant_46[rip]
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
.ArrayAccessExpressionArrayEvaluation_47:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
.Statement_48:
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
.Statement_49:
    nop
    jmp .Statement_27
.NullStatement_31:
    nop
.Statement_50:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_51:
    nop
    leave
    ret
.Function_52:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_53:
.Statement_54:
.BinaryOperatorLeftOperand_55:
.BinaryOperatorLeftOperand_57:
.BinaryOperatorLeftOperand_59:
.BinaryOperatorLeftOperand_61:
    mov rax, .Constant_64[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_63:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
.BinaryOperatorRightOperand_62:
    mov rax, .Constant_66[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_65:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_60:
    mov rax, .Constant_68[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_67:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_58:
.BinaryOperatorLeftOperand_69:
.BinaryOperatorLeftOperand_71:
    mov rax, .Constant_74[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_73:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
.BinaryOperatorRightOperand_72:
    mov rax, .Constant_76[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_75:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_70:
    mov rax, .Constant_78[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_77:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    pop rsi
    add qword ptr [rsp], rsi
.BinaryOperatorRightOperand_56:
.BinaryOperatorLeftOperand_79:
.BinaryOperatorLeftOperand_81:
    mov rax, .Constant_84[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_83:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
.BinaryOperatorRightOperand_82:
    mov rax, .Constant_86[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_85:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_80:
    mov rax, .Constant_88[rip]
    push rax
.ArrayAccessExpressionArrayEvaluation_87:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 3
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
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    pop rsi
    add qword ptr [rsp], rsi
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_89:
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
    mov rdi, 24
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_91:
    cmp qword ptr [rsp], 3
    je .ArrayInitializeLoopEnd_90
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_91
.ArrayInitializeLoopEnd_90:
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
.Statement_92:
.Statement_93:
    mov rax, .Constant_94[rip]
    push rax
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_95:
.BinaryOperatorLeftOperand_96:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_97:
    mov rax, .Constant_98[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setl al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_99
.Statement_100:
.Statement_101:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_102:
    mov rbx, rbp
    push rbx
    call .Function_22
    add rsp, 8
    push r15
    add rsp, 8
.Statement_103:
    mov rbx, rbp
    push rbx
    call .Function_52
    add rsp, 8
    push r15
    add rsp, 8
.Statement_104:
.BinaryOperatorLeftOperand_105:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_106:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_108
.Statement_107:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
    jmp .NullStatement_109
.Statement_108:
    nop
.NullStatement_109:
    nop
.Statement_110:
.BinaryOperatorLeftOperand_111:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_112:
    mov rax, .Constant_113[rip]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_114:
    nop
    jmp .Statement_95
.NullStatement_99:
    nop
.Statement_115:
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
