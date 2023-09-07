var a = 1

proc fun() =
    a = 2
    
    #允许声明一个同名的变量么
    var a = 3
    var b = a
    echo "in fun:a=", a, ",b=", b, "\n"

var b = 4

proc main =
    
    #全局变量
    echo "main--1: a=", a, ",b=", b, "\n"
    
    fun()
    echo "main--2: a=", a, ",b=", b, "\n"

    #覆盖全局变量
    var a = 5
    var b = 5
    echo "main--3: a=", a, ",b=", b, "\n"

    #测试块级作用域
    if a > 0:
        var b = 3
        echo "main--4: a=", a, ",b=", b, "\n"
    else:
        var b = 4
        echo "main--5: a=", a, ",b=", b, "\n"
    
    echo "main--6: a=", a, ",b=", b, "\n"

main()