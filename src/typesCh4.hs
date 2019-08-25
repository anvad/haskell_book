module TypesChFour where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah


main = do
    let a = 5
    print a
    let a = 6
    print a

greetIfCool :: String -> IO()
greetIfCool coolness =
    if cool
        then putStrLn "eyyy. What's shakin'?"
    else
        putStrLn "pshhh."
    where cool =
            coolness == "downright frosty yo"

greetIfCool2 :: String -> IO()
greetIfCool2 coolness =
    if cool coolness
        then putStrLn "eyyy. What's shakin'?"
        else
            putStrLn "pshhh."
        where cool c2 = 
                c2 == "downright frosty yo"

-- isPalindrome :: Eq a => [a] -> Bool
isPalindrome s =
    s == reverse s

myAbs :: Integer -> Integer
myAbs x =
    if x < 0
        then x * (-1)
    else
        x
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f p1 p2 =
    ((snd p1, snd p2), (fst p1, fst p2))

x = (+)

f2 :: [char] -> Int
f2 xs = w `x` 1
    where w = length xs
