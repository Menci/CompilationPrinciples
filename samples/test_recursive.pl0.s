.intel_syntax noprefix
.text
.TopLevel_24:
.Constants_1:
.Constant_8:
    .quad 0
.Constant_14:
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
    setne al
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
    call builtin$writeln
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
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rbx, rbp
    push rbx
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    mov qword ptr [r14], 0
    pop rbx
.Statement_20:
.Statement_21:
    mov rbx, rbp
    mov rax, -1
    lea r14, qword ptr [rbx + rax * 8]
    push r14
    call builtin$read
    add rsp, 8
    push r15
    add rsp, 8
.Statement_22:
    mov rbx, rbp
    push rbx
    call .Function_3
    add rsp, 8
    push r15
    add rsp, 8
.Statement_23:
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
