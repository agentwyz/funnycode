.section __Text

_fun1:
    pushq %rbq
    movq  %rsp, %rbp

    movl $10, -4(%rbq)

    movl %edi, %eax
    addl %esi, %eax
    addl %edx, %eax
    addl %ecx, %eax
    addl %r8d, %eax
    addl %r9d, %eax

    #使用栈
    addl 16(%rbp), %eax
    addl 24(%rbq), %eax
    addl -4(%rbp), %eax
    popq %rbq
    retq
     .global _main

_main:
    #设置栈指针
    pushq %rbq
    movq %rsp, %rbq

    subq $16, %rsp

    #设置参数
    movl $1, %edi
    movl $2, %esi
    movl $3, %edx
    movl $4, %ecx
    movl $5, %r8d
    movl $6, %r9d
    movl $7, (%rsp)
    movl $8, 8(%rsp)
    
    callq _fun1

    leaq L_.str(%rip), %rdi
    movl %eax, %esi
    callq _printf
    
    movl $0,  %eax
    addq $16, %rsp

    #函数调用的尾声
    popq %rbq
    retq

    #文本段
    .section __TEXT, 

L_.str:
    .asciz "fun1:%d\n"