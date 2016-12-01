{-# LANGUAGE FlexibleContexts #-}
import qualified Data.Map as Map
import Data.List as List
import Text.Regex.PCRE

main :: IO ()
main = print . length . runRules . lines =<< getContents

toggleLights :: [String] -> Map (Int, Int) Int
toggleLights rules = List.foldl doRule Map.empty rules
    where doRule grid rule
            | rule =~ "^turn on.*" = turnOn grid (numbers rule)
            | rule =~ "^turn off.*" = turnOff grid (numbers rule)
            | rule =~ "^toggle.*" = toggle grid (numbers rule)
          numbers s = List.map read $ getAllTextMatches (s =~ "\\d+")
          turnOn grid range = Set.union grid (setOf range)
          turnOff grid range = Set.difference grid (setOf range)
          toggle grid range = Set.union onlyRange onlyGrid
              where rset = setOf range
                    commonElems = Set.intersection grid rset
                    onlyGrid = Set.difference grid commonElems
                    onlyRange = Set.difference rset grid
          setOf [x1, y1, x2, y2] = Set.fromList [(x, y) | x <- [x1..x2], y <- [y1..y2]]
