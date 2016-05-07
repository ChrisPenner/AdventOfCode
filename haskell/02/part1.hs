import Data.List.Split (splitOn)

main :: IO ()
main = getContents >>= (return . sum . (fmap getSquareFootage) . lines) >>= print

getSquareFootage :: String -> Int
getSquareFootage box = area dims + slack dims
    where dims =  read <$> splitOn "x" box
          slack = minimum . sides
          sides [l, w, h] = [l*w, w*h, h*l]
          area [l, w, h] = 2*l*w + 2*w*h + 2*h*l
