.intel_syntax noprefix
.text
.TopLevel_34:
.Constants_1:
.Constant_11:
    .quad 2
.Constant_12:
    .quad 3
.Constant_18:
    .quad 3
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov rbx, rbp
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
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
    push rbx
    mov rax, -6
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
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_6:
.BinaryOperatorLeftOperand_7:
.BinaryOperatorLeftOperand_9:
    mov rax, .Constant_11[rip]
    push rax
.BinaryOperatorRightOperand_10:
    mov rax, .Constant_12[rip]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_8:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -3
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_13:
.BinaryOperatorLeftOperand_14:
.BinaryOperatorLeftOperand_16:
    mov rax, .Constant_18[rip]
    push rax
.BinaryOperatorRightOperand_17:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
.BinaryOperatorRightOperand_15:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -4
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_19:
.BinaryOperatorLeftOperand_20:
.BinaryOperatorLeftOperand_22:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_23:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    add qword ptr [rsp], rsi
.BinaryOperatorRightOperand_21:
.BinaryOperatorLeftOperand_24:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_25:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    pop rsi
    add qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -5
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_26:
.BinaryOperatorLeftOperand_27:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_28:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    mov rbx, rbp
    mov rax, -6
    lea r14, qword ptr [rbx + rax * 8]
    pop qword ptr [r14]
.Statement_29:
    mov rbx, rbp
    mov rax, -3
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_30:
    mov rbx, rbp
    mov rax, -4
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_31:
    mov rbx, rbp
    mov rax, -5
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_32:
    mov rbx, rbp
    mov rax, -6
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_33:
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
