module Reverse where

rvrs :: String -> String
rvrs s =
    x ++ y ++ z where
    z = take 5 s
    y = take 4 (drop 5 s)
    x = take 7 (drop 9 s)

main :: IO()
main = print $ rvrs "Curry is awesome"
