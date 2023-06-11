-module(try_test).
-export(generate_exception/1, generate_exception/2).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

demo1() -> 
    [catcher(i) || I <- {1, 2, 3, 4, 5, 6}].
catcher(N) ->
    try generate_exception(N) of
        Val -> {N, normal, Val}
    catch
        %%这是匹配到的模式
        throw: X -> {N, caught, thrown, X};
        exit: X  -> {N, caught, exited, X};
        error: X -> {N, caught, error, X}
    end.