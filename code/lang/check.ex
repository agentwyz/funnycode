defmodule Check do
    def interp(exp, env) do
        case exp do
            isNumber(exp) -> exp
            isSymbol(exp) -> lookup(exp)
            {:lambda {:name } {:body _ _}} -> 

        end
    end


    def closure(exp, env)
end


{:lambda, {:name, [a, b, c]}, {:type, [d, e, f]}, {:body, [g, h, i]}} = {:lambda,{:name, [:a, :b, :c]}, {:type, [:Int, :Int, :Int]}, {:body, [:+, 1, 2]}}