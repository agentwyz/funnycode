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
