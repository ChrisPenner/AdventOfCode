import Data.List (nub)

main :: IO ()
main = getContents >>= return . length . nub . concat . (fmap visitedPoints) . split >>= print
    where split l@(_:xs) = [takeEveryOther l, takeEveryOther xs]

data Point = Point Int Int deriving (Show, Eq)

takeEveryOther :: [a] -> [a]
takeEveryOther (x:[]) = [x]
takeEveryOther (x:_:[]) = [x]
takeEveryOther (x:_:xs) = x: takeEveryOther xs

visitedPoints :: String -> [Point]
visitedPoints = locations (Point 0 0)
    where locations _ [] = []
          locations p (char:chars) = (next p char) : locations (next p char) chars
          next (Point x y) '>' = Point (x + 1) y
          next (Point x y) '<' = Point (x - 1) y
          next (Point x y) 'v' = Point x (y + 1)
          next (Point x y) '^' = Point x (y - 1)
