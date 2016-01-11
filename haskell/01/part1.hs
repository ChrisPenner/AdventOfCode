main = do
    input <- readFile "input.txt"
    print $ sum (map val input)
        where val '(' = 1
              val ')' = -1
              val c = 0
