quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = quicksort mini ++ [x] ++ quicksort maxi
    where mini = filter (<x) xs
         maxi = filter (>x) xs