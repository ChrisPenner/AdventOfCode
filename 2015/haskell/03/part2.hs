import Data.List (nub)
import Control.Arrow

data Point = Point Int Int deriving (Show, Eq)

start :: Point
start = Point 0 0

main :: IO ()
main = fmap (length . nub . allPositions) getContents >>= print
    where join = uncurry (++)
          split = (reducer . getEven) &&& (reducer . getOdd)
          allPositions :: String -> [Point]
          allPositions = join . split

getEven :: [a] -> [a]
getEven (x:_:rest) = x: getEven rest
getEven [x] = [x]
getEven [] = []

getOdd :: [a] -> [a]
getOdd = getEven . drop 1

next :: Char -> Point -> Point
next '>' (Point x y) = Point (x + 1) y
next '<' (Point x y) = Point (x - 1) y
next 'v' (Point x y) = Point x (y + 1)
next '^' (Point x y) = Point x (y - 1)

reducer :: String -> [Point]
reducer = scanl (flip next) start
