import Data.Set as Set
import Data.List as List
import Data.String.Utils (startswith)
import Text.Regex.PCRE

main :: IO ()
main = print . length . toggleLights . lines =<< getContents

getNumbers :: String -> [Integer]
getNumbers = map read . getAllTextMatches . (=~ "\\d+")


toggleLights :: [String] -> Set (Int, Int)
toggleLights rules = List.foldl doRule Set.empty rules
    where doRule grid rule
            | rule =~ "^turn on.*" = turnOn grid (getNumbers rule)
            | rule =~ "^turn off.*" = turnOff grid (getNumbers rule)
            | rule =~ "^toggle.*" = toggle grid (getNumbers rule)
          turnOn grid range = Set.union grid (setOf range)
          turnOff grid range = Set.difference grid (setOf range)
          toggle grid range = Set.union onlyRange onlyGrid
              where rset = setOf range
                    commonElems = Set.intersection grid rset
                    onlyGrid = Set.difference grid commonElems
                    onlyRange = Set.difference rset grid
          setOf [x1, y1, x2, y2] = Set.fromList [(x, y) | x <- [x1..x2], y <- [y1..y2]]


