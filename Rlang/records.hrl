-module().
-export([]).

-record(todo, {
    status = reminder,
    who = joe, 
    text
})

%%{text=undefined}
X = #todo{}.

X1 = #todo{status=urgent, who=joe, text = undefined}.

%%{X1, 然后修改}
X2 = X1#todo{status=done}.

%%record其实也是可以进行模式匹配的
#todo{who=W, text=Txt} = X2.

%%在函数里面模式匹配记录
clear_status(#todo{status=S, who=W} = R) ->
    %%在函数内部, S和W绑定了记录里面的字段值
    %%values In the records
    R#todo{status=finished}.

%%这是一个映射的结构
F1 = #{a => 1, b => 2}.