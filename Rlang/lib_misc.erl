-module().
-export([]).

%%这是一个递归函数调用
%%这个函数模拟了那个for的作用
%%这个函数的参数是说Max==Max
for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(i) | for(I + 1, Max, F)].


%%执行一下这个东西
X = for(1, 10, fun(I) -> I end).

sum([H | T]) -> H + sum(T);
sum([]) -> 0.

Y = sum([1, 2, 3]).


map(_, []) -> [];
map(F, [H | T]) -> [F(H) | map(F, T)].


total(L) ->
    sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).

Z = [2 * X || X <- L].


qsort([]) -> [];
qsort([Pivot | T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot])


%%毕达哥拉斯三元组
pythag(N) ->
    [ {A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A + B + C =< N,
        A * A + B * B =:= C * C
    ].

