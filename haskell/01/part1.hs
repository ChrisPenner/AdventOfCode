countParens :: String -> Int
countParens = sum . map mapParen
mapParen '(' = 1
mapParen ')' = -1

main :: IO ()
main = countParens <$> getContents >>= print
