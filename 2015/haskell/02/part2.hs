import Data.List.Split (splitOn)

main :: IO ()
main = getContents >>= (return . sum . (fmap getRibbon) . lines) >>= print

getRibbon :: String -> Int
getRibbon box = volume + (perimeter dims)
    where dims =  read <$> splitOn "x" box
          perimeter [l, w, h] = minimum [2*(l+w), 2*(w+h), 2*(h+l)]
          sides [l, w, h] = [l*w, w*h, h*l]
          volume = product dims
