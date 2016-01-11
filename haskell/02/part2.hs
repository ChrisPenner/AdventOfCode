import Data.List

main :: IO ()
main = readFile "input.txt" >>= print . totalArea

totalArea :: String -> Int
totalArea = sum . (map $ ribbon . cast . parseSides) . lines

cast :: [String] -> [Int]
cast xs = map read xs 

parseSides :: String -> [String]
parseSides = splitBy 'x'

ribbon :: [Int] -> Int
ribbon sides@(x:y:z:_) = (2 * (min1 + min2)) + (product sides)
    where
        min1 = minimum sides :: Int
        min2 = minimum (delete min1 sides) :: Int

splitBy :: Char -> String -> [String]
splitBy delimiter = foldr f [[]]
    where f c l@(x:xs)
            | c == delimiter = []:l
            | otherwise = (c:x):xs
