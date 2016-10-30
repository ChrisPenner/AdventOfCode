import Data.List (nub)

data Point = Point Int Int deriving (Show, Eq)
data Dir = U | D | L | R

start :: Point
start = Point 0 0

main :: IO ()
main = fmap (length . nub . reducer . fmap toDir) getContents >>= print

toDir :: Char -> Dir
toDir '>' = R
toDir 'v' = D
toDir '<' = L
toDir '^' = U

next :: Dir -> Point -> Point
next  R (Point x y) = Point (x + 1) y
next  L (Point x y) = Point (x - 1) y
next  D (Point x y) = Point x (y + 1)
next  U (Point x y) = Point x (y - 1)

reducer :: [Dir] -> [Point]
reducer = scanr next start
