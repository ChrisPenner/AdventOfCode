-- import Data.Digest.Pure.MD5 (md5, MD5Digest)
import Data.Digest.Pure.MD5 (md5)
import  Data.ByteString.Lazy.Char8 (pack)
import  Data.List (findIndex)
import Data.Maybe (fromJust)

key :: String
key = "iwrupvqb"

count :: [Int]
count = [0..]

keys :: [String]
keys = map getKey count
    where getKey n = key ++ show n

getNum :: [String] -> Int
getNum = fromJust . findIndex (== "00000") . map (take 5) . hashes
    where hashes = map (show . md5 . pack)

main :: IO()
main = print (getNum keys)
