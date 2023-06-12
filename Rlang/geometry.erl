-module(geometry).          %%这是一行模块声明, 与文件名称一致
-export([test/0, area/1]).  %%这是函数的导出

%%关于符号的使用
%%逗号分隔函数 数据构造 模式中的参数调用,
%%分号分隔子句;
%%句号(.) 分隔函数


%%参数, 函数体, 返回值
area({rectangle, Width, Heigit}) -> Width * Heigit;
area({square, Side})             -> Side * Side;
area({circle, Radius})           -> 3.1459 * Radius * Radius.


test() ->
    
    %%根据函数的参数进行模式匹配
    %%执行函数genmetry:area({rectangle, 10, 5})
    %%执行函数genmetry:area({square, 10})
    %%执行函数genmetry:area({circle, 10})    
    
    %%如果我们使用Union类型是否就不会出现这种函数的重载
    %%如果想在函数外部使用的话推荐使用:模块名称+
    12      = area({rectangle, 3, 4}),
    144     = area({square, 12}),
    3.14159 = area({circle, 1, 2}),

    %%表示函数返回的结果
    test_worked.