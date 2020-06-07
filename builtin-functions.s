.intel_syntax noprefix

.text

# Integer IO

read_fmt:
    .string "%lld"
.globl builtin$read
builtin$read:
    lea rdi, read_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, scanf[rip]
    jmp builtin$callsysv
write_fmt:
    .string "%lld"
.globl builtin$write
builtin$write:
    lea rdi, write_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv
writeln_fmt:
    .string "%lld\n"
.globl builtin$writeln
builtin$writeln:
    lea rdi, writeln_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv

# Floating IO

readf_fmt:
    .string "%lf"
.globl builtin$readf
builtin$readf:
    lea rdi, readf_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, scanf[rip]
    jmp builtin$callsysv
writef_fmt:
    .string "%.10lf"
.globl builtin$writef
builtin$writef:
    lea rdi, writef_fmt[rip]
    movsd xmm0, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv
writefln_fmt:
    .string "%.10lf\n"
.globl builtin$writefln
builtin$writefln:
    lea rdi, writefln_fmt[rip]
    movsd xmm0, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv

# String IO

readsln_fmt:
    .string "%m[^\n]"
.globl builtin$readsln
builtin$readsln:
    mov rdi, qword ptr [rsp + 8]
    mov rdi, qword ptr [rdi]
    lea rax, free[rip]
    call builtin$callsysv
    lea rdi, readsln_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, scanf[rip]
    call builtin$callsysv
    lea rax, getchar[rip] # eat '\n'
    jmp builtin$callsysv
reads_fmt:
    .string "%ms"
.globl builtin$reads
builtin$reads:
    mov rdi, qword ptr [rsp + 8]
    mov rdi, qword ptr [rdi]
    lea rax, free[rip]
    call builtin$callsysv
    lea rdi, reads_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, scanf[rip]
    jmp builtin$callsysv
writes_fmt:
    .string "%s"
.globl builtin$writes
builtin$writes:
    lea rdi, writes_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv
writesln_fmt:
    .string "%s\n"
.globl builtin$writesln
builtin$writesln:
    lea rdi, writesln_fmt[rip]
    mov rsi, qword ptr [rsp + 8]
    lea rax, printf[rip]
    jmp builtin$callsysv

# String Utility

.globl builtin$strlen
builtin$strlen:
    mov rdi, qword ptr [rsp + 8]
    lea rax, strlen[rip]
    call builtin$callsysv
    mov r15, rax
    ret
strcat_fmt:
    .string "%s%s"
.globl builtin$strcat
builtin$strcat:
    sub rsp, 8
    mov rdi, rsp
    lea rsi, strcat_fmt[rip]
    mov rdx, qword ptr [rsp + 32] # arg 1
    mov rcx, qword ptr [rsp + 24] # arg 2
    lea rax, asprintf[rip]
    call builtin$callsysv
    mov rdi, qword ptr [rsp + 16] # arg 3
    mov rdi, qword ptr [rdi]
    lea rax, free[rip]
    call builtin$callsysv
    mov rdi, qword ptr [rsp + 16] # arg 3
    pop qword ptr [rdi]
    ret
.globl builtin$getchr
builtin$getchr:
    mov rdi, qword ptr [rsp + 16]
    mov rsi, qword ptr [rsp + 8]
    movzx r15, byte ptr [rdi + rsi]
    ret
.globl builtin$setchr
builtin$setchr:
    mov rdi, qword ptr [rsp + 24]
    mov rsi, qword ptr [rsp + 16]
    mov rax, qword ptr [rsp + 8]
    mov byte ptr [rdi + rsi], al
    ret

.globl builtin$callsysv
builtin$callsysv:
    # Make stack 16-bit aligned
    push rsp
    push qword ptr [rsp]
    and rsp, -16
    call rax
    # Restore stack
    mov rsp, qword ptr [rsp + 8]
    ret

checkarrayindex_fmt:
    .string "Runtime Error: Invalid index %lld for the %lld-th dimension, valid range is [%lld, %lld]\n"
.globl builtin$checkarrayindex
builtin$checkarrayindex:
    mov rdx, qword ptr [rsp + 32] # i
    cmp rdx, qword ptr [rsp + 16] # max
    jg checkarrayindex_fail
    cmp rdx, qword ptr [rsp + 24] # min
    jl checkarrayindex_fail
    ret
checkarrayindex_fail:
    mov rdi, 2
    lea rsi, checkarrayindex_fmt[rip]
    mov rdx, qword ptr [rsp + 32]
    mov rcx, qword ptr [rsp + 8]
    mov r8, qword ptr [rsp + 24]
    mov r9, qword ptr [rsp + 16]
    lea rax, dprintf[rip]
    call builtin$callsysv
    mov rdi, 1
    lea rax, exit[rip]
    jmp builtin$callsysv
