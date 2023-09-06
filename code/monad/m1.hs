data Exp = 
    Lit Integer
    | Add Exp Exp
    | Sub Exp Exp
    | Mul Exp Exp
    | Div Exp Exp


eval :: Exp -> Integer
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2
eval (Mul e1 e2) = eval e1 * eval e2
eval (Div e1 e2) = eval e1 / eval e2

--但是这样lit0 就会报一个错误
safeEval :: Exp -> Maybe Integer

safeEval (Lit n) = Just n

safeEval (Add e1 e2) =
    case safeEval e1 of
        Nothing -> Nothing
        Just n1 -> case safeEval e2 of
            Nothing -> Nothing
            Just n2 -> Just (n1 + n2)

safeEval (Sub e1 e2) =
    case safeEval e1 of
        Nothing -> Nothing
        Just n2 -> Just (n)