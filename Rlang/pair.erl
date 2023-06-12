-module(pair).
-export([pair/2, append/2, len/1, nth/2]).

%%构造一个pair
pair(A, B)  -> [A, B].

%%添加一个元素
append(A, B) -> [A | B].

%%计算一个list的长度
len([]) -> 0;
len([_ | Tail])  -> 1 + length(Tail).

%%根据索引获取对应的元素
nth([], N) -> error("this is a null");
nth([Hd | _], N) when N =:= 0 -> Hd;
nth([_ | Tail], N) -> nth(Tail, N - 1).