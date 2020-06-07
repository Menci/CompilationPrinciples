.intel_syntax noprefix
.text
.TopLevel_93:
.Constants_1:
.Constant_3:
    .quad 1
.Constant_4:
    .quad 2
.Constant_29:
    .quad 0
.Constant_33:
    .quad 0
.Constant_53:
    .quad 1
.Constant_59:
    .quad 1
.Constant_68:
    .quad 1
.Constant_78:
    .quad 1
.Function_5:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_6:
.Statement_7:
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    neg qword ptr [rsp]
    pop rcx
    pop rax
    and rax, rcx
    push rax
    pop r15
.Statement_8:
    nop
    leave
    ret
.Function_9:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_10:
.Statement_11:
.BinaryOperatorLeftOperand_12:
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_13:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setle al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_14
.Statement_15:
.Statement_16:
.BinaryOperatorLeftOperand_17:
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_19:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 100000
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
.BinaryOperatorRightOperand_18:
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_20:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 100000
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
.Statement_21:
.BinaryOperatorLeftOperand_22:
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_23:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_5
    add rsp, 16
    push r15
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, 3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_24:
    nop
    jmp .Statement_11
.NullStatement_14:
    nop
.Statement_25:
    nop
    leave
    ret
.Function_26:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_27:
.Statement_28:
    mov rax, .Constant_29[rip]
    push rax
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_30:
.BinaryOperatorLeftOperand_31:
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_32:
    mov rax, .Constant_33[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_34
.Statement_35:
.Statement_36:
.BinaryOperatorLeftOperand_37:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_38:
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_39:
    mov rax, 3
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 100000
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
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_40:
.BinaryOperatorLeftOperand_41:
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_42:
    mov rax, 3
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_5
    add rsp, 16
    push r15
    pop rsi
    sub qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, 2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_43:
    nop
    jmp .Statement_30
.NullStatement_34:
    nop
.Statement_44:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop r15
.Statement_45:
    nop
    leave
    ret
.Function_46:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_47:
.Statement_48:
.BinaryOperatorLeftOperand_49:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, 2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_26
    add rsp, 16
    push r15
.BinaryOperatorRightOperand_50:
    mov rax, 4
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
.BinaryOperatorLeftOperand_51:
    mov rbx, rbp
    mov rax, 3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_52:
    mov rax, .Constant_53[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    call .Function_26
    add rsp, 16
    push r15
    pop rsi
    sub qword ptr [rsp], rsi
    pop r15
.Statement_54:
    nop
    leave
    ret
.Function_55:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov rbx, rbp
    push rbx
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -6
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
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_56:
.Statement_57:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_58:
    mov rax, .Constant_59[rip]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_61:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_60
.Statement_62:
.Statement_63:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_64:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_9
    add rsp, 24
    push r15
    add rsp, 8
.Statement_65:
    nop
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_61
.ForLoopExit_60:
    add rsp, 8
.Statement_66:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_67:
    mov rax, .Constant_68[rip]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_70:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_69
.Statement_71:
.Statement_72:
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_73:
    mov rbx, rbp
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_74:
    mov rbx, rbp
    mov rax, -6
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_75:
.BinaryOperatorLeftOperand_76:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_77:
    mov rax, .Constant_78[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_82
.Statement_79:
.Statement_80:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_9
    add rsp, 24
    push r15
    add rsp, 8
.Statement_81:
    nop
    jmp .NullStatement_85
.Statement_82:
.Statement_83:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call .Function_46
    add rsp, 24
    push r15
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_84:
    nop
.NullStatement_85:
    nop
.Statement_86:
    nop
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_70
.ForLoopExit_69:
    add rsp, 8
.Statement_87:
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
    mov rdi, 800000
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_89:
    cmp qword ptr [rsp], 100000
    je .ArrayInitializeLoopEnd_88
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_89
.ArrayInitializeLoopEnd_88:
    add rsp, 8
    pop rbx
    push rbx
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_90:
.Statement_91:
    mov rbx, rbp
    push rbx
    call .Function_55
    add rsp, 8
    push r15
    add rsp, 8
.Statement_92:
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
