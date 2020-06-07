.intel_syntax noprefix
.text
.TopLevel_17:
.Constants_1:
.Constant_10:
    .quad 5
.Constant_13:
    .quad 32
.Constant_14:
    .quad 9
.Function_2:
    push rbp
    mov rbp, rsp
    sub rsp, 16
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
.BinaryOperatorLeftOperand_6:
.BinaryOperatorLeftOperand_8:
    mov rax, .Constant_10[rip]
    push rax
.BinaryOperatorRightOperand_9:
.BinaryOperatorLeftOperand_11:
    mov rbx, rbp
    mov rax, -1
    mov rax, qword ptr [rbx + rax * 8]
    push rax
.BinaryOperatorRightOperand_12:
    mov rax, .Constant_13[rip]
    push rax
    pop rsi
    sub qword ptr [rsp], rsi
    pop rsi
    imul rsi, qword ptr [rsp]
    mov qword ptr [rsp], rsi
    cvtsi2sd xmm0, qword ptr [rsp]
    movsd qword ptr [rsp], xmm0
.BinaryOperatorRightOperand_7:
    mov rax, .Constant_14[rip]
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
    mov rbx, rbp
    mov rax, -2
    lea r14, qword ptr [rbx + rax * 8]
    cvttsd2si rax, qword ptr [rsp]
    mov qword ptr [rsp], rax
    pop qword ptr [r14]
.Statement_15:
    mov rbx, rbp
    mov rax, -2
    mov rax, qword ptr [rbx + rax * 8]
    push rax
    call builtin$writeln
    add rsp, 8
    push r15
    add rsp, 8
.Statement_16:
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
