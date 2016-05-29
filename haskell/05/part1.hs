{-# LANGUAGE FlexibleContexts #-}
import Text.Regex.PCRE

isNice :: String -> Bool
isNice s = vowels s && double s && taboo s
    where vowels s = s =~ "(.*[aeiou].*){3,}"
          double s = s =~"([a-zA-Z])\\1" 
          taboo s = not (s =~ "ab|cd|pq|xy")

main :: IO ()
main = print . length . filter isNice . lines =<< getContents
