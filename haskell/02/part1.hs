main :: IO ()
main = readFile "input.txt" >>= print . totalArea

totalArea :: String -> Int
totalArea = sum . (map $ paper . cast . parseSides) . lines

cast :: [String] -> [Int]
cast xs = map read xs 

parseSides :: String -> [String]
parseSides = splitBy 'x'

paper :: [Int] -> Int
paper (x:y:z:_) = (minimum sides) + (area sides)
    where
        sides :: [Int]
        sides = [x*y, y*z, x*z]
        area :: [Int] -> Int
        area s = 2 * (sum s)


splitBy :: Char -> String -> [String]
splitBy delimiter = foldr f [[]]
    where f c l@(x:xs)
            | c == delimiter = []:l
            | otherwise = (c:x):xs
