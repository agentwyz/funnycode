-module(geometry).       %%这是一行模块声明
-export([test/0, area/1]).

%%关于符号的使用
%%逗号分隔函数 数据构造 模式中的参数调用,
%%分号分隔子句;
%%句号(.) 分隔函数


%%执行函数genmetry:area({rectangle, 10, 5})
%%执行函数genmetry:area({square, 10})
area({rectangle, Width, Heigit}) -> Width * Heigit;
area({square, Side})             -> Side * Side;
area({circle, Radius})           -> 3.1459 * Radius * Radius.


test() ->
    %%这个语法表示模式匹配
    12  = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    %%返回这个结果, hahhaha
    test_worked.