countParens :: String -> Int
countParens = sum . map mapParen
mapParen :: Char -> Int
mapParen '(' = 1
mapParen ')' = -1

countTill :: [Char] -> Int
countTill = length . takeWhile (>= 0) . scanl (+) 0 . map mapParen

main :: IO ()
main = countTill <$> getContents >>= print
