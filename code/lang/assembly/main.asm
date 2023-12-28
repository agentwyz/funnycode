.section __TEXT, __text, regular, pure_instruction

_fun1:
    #设置栈指针
    pushq %rbp          #将栈的底部地址压入栈
    movq %rsp, %rbp     #将栈顶元素, 保存到rbp
    subq $4, %rsp       #减去四地址, 分配函数参数
    movl $10, -4(%rbp)  #将变量c赋值为10


    movl %edi, %eax     #将第一个参数放入%eax 
    addl %esi, %eax     #将第二个参数加到%ex
    addl -4(%rbp), %eax

    addq $4, %rsp

    popq %rbp
    retq

    .global _main

_main:
    pushq %rbq          #把调用者的栈帧底部地址保存起来
    movq  %rsq, %rbq    #将栈顶元素保存到rbq

    #分别设置两个参数
    movl $1, %edi
    movl $2, %esi

    #调用函数
    callq _fun1

    #为printf设置参数
    leaq L_.str(%rip), %rdi
    movl %eax, %esi
    
    callq _printf
    
    movl $0, %eax  #设置返回值
    popq %rbq
    retq

    .section __TEXT, __cstring, cstring_literals

L_.str:
    .asciz "Hello World:%d \n"