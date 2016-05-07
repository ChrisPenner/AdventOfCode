import Data.Set (Set)
import Data.List (nub)

main :: IO ()
main = getContents >>= return . length . nub . visitedPoints >>= print

data Point = Point Int Int deriving (Show, Eq)

visitedPoints :: String -> [Point]
visitedPoints = locations (Point 0 0)
    where locations p [] = []
          locations p (char:chars) = (next p char) : locations (next p char) chars
          next (Point x y) '>' = Point (x + 1) y
          next (Point x y) '<' = Point (x - 1) y
          next (Point x y) 'v' = Point x (y + 1)
          next (Point x y) '^' = Point x (y - 1)
