%%-define(Constant, Replacement).
%%-define(Func(Var1, Var2), Replacement).


-define(macro1(X, Y), {a, X, Y}).

foo(A) ->
    ?macro1(A+10, b).

%%下面是一些常用的宏
%%?FILE展开成为当前的文件名称
%%?MOUDLE展开成为当前的模块名称
%%?LINE展开成为当前的行号


%%-undef(Marco). 取消宏的定义
%%-ifdef(Macro). 当且 
%%-ifndef(Macro).
%%-else.可以用于ifdef或者ifndef语句之后, 如果条件为否, else
%%-endif.标记ifdef或者ifndef语句的结尾

%%下面是常见的手法
%%-ifdef(<FlagName>).
%%-define(...).
%%-else.
%%-define(...).
%%endif.


-ifdef(debug_flag).
-define().



loop(0) ->
    done;
loop(N) ->
    ?DEBUG(N).