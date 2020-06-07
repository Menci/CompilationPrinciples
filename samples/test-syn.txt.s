.intel_syntax noprefix
.text
.TopLevel_104:
.Constants_1:
.Constant_8:
    .quad 0
.Constant_14:
    .quad 1
.Constant_21:
    .quad 0
.Constant_33:
    .quad 0
.Constant_37:
    .quad 10
.Constant_41:
    .quad 0
.Constant_45:
    .quad 0
.Constant_56:
    .quad 10
.Constant_60:
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
    mov rax, -1
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
    jz .Statement_17
.Statement_9:
.Statement_10:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_11:
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
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_15:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_16:
    nop
    jmp .NullStatement_18
.Statement_17:
    nop
.NullStatement_18:
    nop
.Statement_19:
    nop
    leave
    ret
.Function_23:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_24:
.Statement_25:
    mov rax, .Constant_21[rip]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_26:
    nop
    leave
    ret
.Function_22:
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
.Statement_27:
.Statement_28:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_29:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_30:
.BinaryOperatorLeftOperand_31:
    mov rbx, rbp
    mov rax, -3
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
    jz .Statement_65
.Statement_34:
.BinaryOperatorLeftOperand_35:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_36:
    mov rax, .Constant_37[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setl al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_63
.Statement_38:
.Statement_39:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_40:
    mov rax, .Constant_41[rip]
    push rax
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_42:
.BinaryOperatorLeftOperand_43:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_44:
    mov rax, .Constant_45[rip]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setge al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .NullStatement_46
.Statement_47:
.Statement_48:
.BinaryOperatorLeftOperand_49:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_50:
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
.Statement_51:
.BinaryOperatorLeftOperand_52:
.BinaryOperatorLeftOperand_54:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_55:
    mov rax, .Constant_56[rip]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_53:
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
.Statement_57:
.BinaryOperatorLeftOperand_58:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_59:
    mov rax, .Constant_60[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_61:
    nop
    jmp .Statement_42
.NullStatement_46:
    nop
.Statement_62:
    nop
    jmp .NullStatement_64
.Statement_63:
    nop
.NullStatement_64:
    nop
    jmp .NullStatement_66
.Statement_65:
    nop
.NullStatement_66:
    nop
.Statement_67:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_68:
    nop
    leave
    ret
.Function_20:
    push rbp
    mov rbp, rsp
    sub rsp, 0
    mov rbx, rbp
.Statement_69:
.Statement_70:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_71:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_72:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_73:
.BinaryOperatorLeftOperand_74:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_75:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setg al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_77
.Statement_76:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    jmp .NullStatement_78
.Statement_77:
    nop
.NullStatement_78:
    nop
.Statement_79:
.BinaryOperatorLeftOperand_80:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_81:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setle al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_83
.Statement_82:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    jmp .NullStatement_84
.Statement_83:
    nop
.NullStatement_84:
    nop
.Statement_85:
.BinaryOperatorLeftOperand_86:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_87:
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
    jz .Statement_89
.Statement_88:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    jmp .NullStatement_90
.Statement_89:
    nop
.NullStatement_90:
    nop
.Statement_91:
.BinaryOperatorLeftOperand_92:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_93:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    setle al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_95
.Statement_94:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    jmp .NullStatement_96
.Statement_95:
    nop
.NullStatement_96:
    nop
.Statement_97:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_98:
    mov rax, 2
    mov rbx, qword ptr [rbp + rax * 8]
    push rbx
    mov rbx, rbp
    push rbx
    call .Function_22
    add rsp, 16
    push r15
    add rsp, 8
.Statement_99:
    nop
    leave
    ret
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 40
    mov rbx, rbp
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
    push rbx
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_100:
.Statement_101:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_102:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_103:
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
