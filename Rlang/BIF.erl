-module(BIF).
-export([f/2]).


max(X, Y) when X > Y -> X;
max(X, Y) -> Y.

%%关卡序列
f(X, Y) when is_integer(X), X > Y, Y < 6 -> [X, Y].
f(X) 

