-module(shop1).
-export([total/1, Even/1]).

%%这里是递归调用
total([{What, N} | T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.

%%对列表中的每一个元素做相同的操作
%%创建自已的控制抽象
%%实现可以重入解析代码

Double = fun(X) -> 2 * X end.

TempConvert = fun({c, C}) -> {f, 32 + C * 9 / 5};
                 ({f, F}) -> {c, (F - 32) * 5 / 9}
              end.

 
Even = fun(X) -> (X rem 2) =:= 0 end.

MakeTest = fun(L) -> (fun(X) - lists:member(X, L) end) end.