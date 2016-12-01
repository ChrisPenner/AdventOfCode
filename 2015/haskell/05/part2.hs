{-# LANGUAGE FlexibleContexts #-}
import Text.Regex.PCRE

isNice :: String -> Bool
isNice s = twice s && split s
    where twice s = s =~ "([a-zA-Z][a-zA-Z]).*\\1"
          split s = s =~ "([a-zA-Z])[a-zA-Z]\\1"

main :: IO ()
main = print . length . filter isNice . lines =<< getContents
