%%首先执行FuncOrExpressionSeq
%%如果执行过程中没有问题就会继续往后面执行
try FuncOrExpressionSeq of
    %%这个地方其实是一个模式匹配
    Pattern1 [when Guard1] -> Expressions1;
    Pattern2 [when Guard2] -> Expressions2;
catch
    %%这个type其实是一个原子
    ExpressionType1: ExPattern1 [when ExGuard1] -> Expressions1;
after
    AfterExpressions
end