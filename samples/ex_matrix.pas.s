.intel_syntax noprefix
.text
.TopLevel_79:
.Constants_1:
.Constant_16:
    .quad 1
.Constant_20:
    .quad 1
.Constant_26:
    .quad 1
.Constant_30:
    .quad 1
.Constant_36:
    .quad 1
.Constant_40:
    .quad 1
.Constant_44:
    .quad 1
.Constant_60:
    .quad 1
.Constant_64:
    .quad 1
.Constant_76:
    .byte 32, 0
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 3200
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_4:
    cmp qword ptr [rsp], 400
    je .ArrayInitializeLoopEnd_3
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_4
.ArrayInitializeLoopEnd_3:
    add rsp, 8
    pop rbx
    push rbx
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 3200
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_6:
    cmp qword ptr [rsp], 400
    je .ArrayInitializeLoopEnd_5
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_6
.ArrayInitializeLoopEnd_5:
    add rsp, 8
    pop rbx
    push rbx
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -10
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -7
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
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
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 3200
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_8:
    cmp qword ptr [rsp], 400
    je .ArrayInitializeLoopEnd_7
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_8
.ArrayInitializeLoopEnd_7:
    add rsp, 8
    pop rbx
    push rbx
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, 3200
    mov rbx, rax
    lea rax, malloc[rip]
    call builtin$callsysv
    mov rbx, rax
    mov qword ptr [r14], rax
    push 0
.ArrayInitializeLoop_10:
    cmp qword ptr [rsp], 400
    je .ArrayInitializeLoopEnd_9
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    push rbx
    mov qword ptr [r14], 0
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayInitializeLoop_10
.ArrayInitializeLoopEnd_9:
    add rsp, 8
    pop rbx
.Statement_11:
.Statement_12:
    mov rbx, rbp
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_13:
    mov rbx, rbp
    mov rax, -6
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_14:
    mov rbx, rbp
    mov rax, -7
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_15:
    mov rax, .Constant_16[rip]
    push rax
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_18:
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_17
.Statement_19:
    mov rax, .Constant_20[rip]
    push rax
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_22:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_21
.Statement_23:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_24:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_22
.ForLoopExit_21:
    add rsp, 8
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_18
.ForLoopExit_17:
    add rsp, 8
.Statement_25:
    mov rax, .Constant_26[rip]
    push rax
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_28:
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_27
.Statement_29:
    mov rax, .Constant_30[rip]
    push rax
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -7
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_32:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_31
.Statement_33:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_34:
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_32
.ForLoopExit_31:
    add rsp, 8
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_28
.ForLoopExit_27:
    add rsp, 8
.Statement_35:
    mov rax, .Constant_36[rip]
    push rax
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_38:
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_37
.Statement_39:
    mov rax, .Constant_40[rip]
    push rax
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_42:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_41
.Statement_43:
    mov rax, .Constant_44[rip]
    push rax
    mov rbx, rbp
    mov rax, -10
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -7
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_46:
    mov rbx, rbp
    mov rax, -10
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_45
.Statement_47:
.BinaryOperatorLeftOperand_48:
    mov rbx, rbp
    mov rax, -10
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_50:
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
.BinaryOperatorRightOperand_49:
.BinaryOperatorLeftOperand_51:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_53:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
.BinaryOperatorRightOperand_52:
    mov rbx, rbp
    mov rax, -10
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_54:
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
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
    mov rbx, rbp
    mov rax, -10
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_55:
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -10
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_46
.ForLoopExit_45:
    add rsp, 8
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_42
.ForLoopExit_41:
    add rsp, 8
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_38
.ForLoopExit_37:
    add rsp, 8
.Statement_56:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    push 0
.ArrayAssignLoop_58:
    cmp qword ptr [rsp], 400
    je .ArrayAssignLoopEnd_57
    mov rax, qword ptr [rsp]
    lea r14, qword ptr [rbx + rax * 8]
    mov rcx, qword ptr [rsp + 8]
    mov rax, qword ptr [rcx + rax * 8]
    push rbx
    push rax
    pop qword ptr [r14]
    pop rbx
    inc qword ptr [rsp]
    jmp .ArrayAssignLoop_58
.ArrayAssignLoopEnd_57:
    add rsp, 8
    add rsp, 8
.Statement_59:
    mov rax, .Constant_60[rip]
    push rax
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_62:
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_61
.Statement_63:
    mov rax, .Constant_64[rip]
    push rax
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
    mov rbx, rbp
    mov rax, -7
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ForLoop_66:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    cmp rsi, qword ptr [rsp]
    jg .ForLoopExit_65
.Statement_67:
.BinaryOperatorLeftOperand_68:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_69:
    mov rbx, rbp
    mov rax, -7
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    xor rax, rax
    cmp qword ptr [rsp], rsi
    sete al
    mov qword ptr [rsp], rax
    pop rax
    test rax, rax
    jz .Statement_72
.Statement_70:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_71:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
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
    jmp .NullStatement_78
.Statement_72:
.Statement_73:
    mov rbx, rbp
    mov rax, -9
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    mov rbx, rbp
    mov rax, -8
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.ArrayAccessExpressionArrayEvaluation_74:
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov rbx, qword ptr [r14]
    xor rax, rax
    push 1
    push 20
    push 1
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 20
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    push 1
    push 20
    push 2
    call builtin$checkarrayindex
    add rsp, 24
    mov rdx, 1
    pop rcx
    sub rcx, 1
    imul rdx, rcx
    add rax, rdx
    lea r14, qword ptr [rbx + rax * 8]
    push qword ptr [r14]
    call builtin$write
    add rsp, 8
    push r15
    add rsp, 8
.Statement_75:
    lea rax, .Constant_76[rip]
    push rax
    call builtin$writes
    add rsp, 8
    push r15
    add rsp, 8
.Statement_77:
    nop
.NullStatement_78:
    nop
    mov rbx, rbp
    mov rax, -9
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_66
.ForLoopExit_65:
    add rsp, 8
    mov rbx, rbp
    mov rax, -8
    lea r14, qword ptr [rbx + rax * 8]
    inc qword ptr [r14]
    jmp .ForLoop_62
.ForLoopExit_61:
    add rsp, 8
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
    push rbx
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    mov rdi, qword ptr [r14]
    lea rax, free[rip]
    call builtin$callsysv
    pop rbx
    push rbx
    mov rax, -4
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
