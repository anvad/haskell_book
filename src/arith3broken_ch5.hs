module Arith3Broken where

main :: IO()
main = do -- changed from Main to main
    print (1 + 2) -- changed from print 1 + 2
    putStrLn "10" -- changed by putting double-quotes around 10
    print (negate (-1)) -- changed by putting parentheses around -1
    print ((+) 0 blah)
    where blah = negate 1
