-module().
-export([]).


list_to_tuple([12, cat, "hello"]).

max(X, Y) when X > Y -> X;
max(X, Y) -> Y.

%%关卡序列
f(X, Y) when is_integer(X), X > Y, Y < 6 -> [X, Y].



if 
    A > 0 -> A;
    A < 0 -> -A;
end.

case of
end;

