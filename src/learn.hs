module Learn where

x = 10 * 5 + y
myResult = x * 5
y = 10

-- testing where declarations
m1 = x * y
    where
        x = 5
        y = 6

e1 = x * 3 + y where
    x = 3
    y = 1000

e2 = x * 5 where
    x = 10 * 5 + y where
        y = 10

-- the below where expression is equivalent to the following let expression:
--     let x = 7; y = negate x; z = y * 10 in z / x + y
-- notice that unlike the e2 expression above, i did not nest multiple where clauses
-- also notice I declared x = 7 at the end, and it did not matter
-- so, ordering of declaration of x, y and z did not matter
e3 = z / x + y where
    y = negate x
    z = y * 10
    x = 7
    

waxOn = x * 5 where
    x = y ^ 2
    y = z + 8
    z = 7

triple x = x * 3

waxOff x = (triple x) + 5

main :: [Char] -> IO()
main x = do
    putStrLn ("hello world!" ++ x)
    putStr "one, two"
    putStr ", three, and"
    putStrLn " four!"

-- print3.hs

myGreeting :: String
myGreeting = "hello" ++ " world!"

hello :: String
hello = "hello"

world :: [Char] -- using [Char] since String is a type alias for a list of Char
world = "world!"

mn2 :: IO()
mn2 = do
    putStrLn myGreeting
    putStrLn secondGreeting where
        secondGreeting = concat [hello, " ", world]

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! (x - 1)

rvrs :: String
rvrs = x ++ y ++ z where
    s = "Curry is awesome"
    z = take 5 s
    y = take 4 (drop 5 s)
    x = take 7 (drop 9 s)






