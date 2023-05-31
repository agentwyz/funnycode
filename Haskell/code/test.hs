--else之后的东西其实是不可以省略的
isTwo :: Int -> Bool
isTwo n = if n == 2 then True else False

--情形分析表达式
month :: Int -> Int
month n = case n of
    1 -> 31
    2 -> 28
    _ -> error "invalid month"

--守卫表达式
abs' :: (Num a, Ord a) => a -> a
abs' n
    | n > 0 = n
    | otherwise = -n

--模式匹配
month :: Int -> Int
month 1 = 21
month 2 = 34
month _ = error "invalid month"
