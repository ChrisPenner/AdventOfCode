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

hashes = map (show . md5 . pack)

main :: IO()
main = print $ (fromJust . findIndex (== "000000") . map (take 6) . hashes) keys

