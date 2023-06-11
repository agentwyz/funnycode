-moudle(pair)
-export([])





%%这是一个pair, 我们返回一个这个
pair(a, b) ->
    fun(k) -> k(a, b) end.
    