continuation概念存在与常见的编程语言中
一个条件语句分支, 选择一个continuation
异常则是丢弃一种continuation
一个尾调用或goto也是一种continuation

尽管continuation是一个无处不在, 十分自然的概念
本文的目的是为了总体的介绍continuation

并且使用delimited continuation操作符号rest shift

1. Introduction

Continuation表示接下来该计算什么的概念
操纵continuation是一种非常强大的工具
可以实现非常复杂的控制流, 而不会破坏程序整体结构

传统的方式去处理显示的连续是将程序转化成为CPS
但是这样就不能保留程序的原有结构, 如果我们想直接操作
continuations

call/cc