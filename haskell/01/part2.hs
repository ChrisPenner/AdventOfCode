values = map val
    where val '(' = 1
          val ')' = -1
          val c = 0

result = length . takeWhile (>= -1) . floorNums
    where floorNums = scanl1 (+) . values

main = do
    input <- readFile "input.txt"
    print $ result input
