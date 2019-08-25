module Print3Broken where

printSecond :: IO()
printSecond = do
    putStrLn "greeting"

main::IO()
main = do
    putStrLn g2
    printSecond
    where
        g2 = "hi"
        greeting = "Yarrr!"