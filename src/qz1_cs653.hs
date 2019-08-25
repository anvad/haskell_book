import Data.Tree
-- https://www.cse.iitk.ac.in/users/karkare/courses/2010/cs653/exams/Quiz1.pdf

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p [ ] = [ ]
myTakeWhile p (x:xs) = if (p x) then x : myTakeWhile p xs else [ ]

s :: (a -> b -> c) -> (a -> b) -> a -> c
s f g x = f x (g x)


reptree :: (a -> [a]) -> a -> Tree a
reptree f p = Node p (map (reptree f) (f p))
-- data Tree a = Node a [Tree a]

-- f :: p -> [p]
-- f p :: [p]

-- define takeWhile in terms of foldr
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- so, foldr: given a func that takes "a" and "b" as args and returns "b", and given "b" and a list of "a", returns "b"
-- so, this is the reduce function.
-- takeWhile returns a list of elements, given a function that takes an element and returns bool, and a list of elements

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- fr :: (a -> b -> b)
-- fw :: (a -> Bool)
-- so, in our case, b has to have form [a], so foldr :: (a -> [a] -> [a]) -> [a] -> [a] -> [a]
-- so, I need fr :: (a -> [a] -> [a]), but I am given ftw :: (a -> Bool)
-- so, how to convert ftw to fr?
-- fr x (xs, xa) = if ftw x && ((length xs) == (length xa)) then (x:xs, x:xa) else (xs, x:xa)

-- e.g. 
-- ftw x = x > 0
-- takeWhile ftw [1, 2, 0, 3, -1, 4]
-- fr x (xs, xa) = if ((ftw x) && ((length xs) == (length xa))) then (x:xs, x:xa) else (xs, x:xa)

-- the following two line implementation of takeWhile using foldr works
-- gen_fr ftw x xs = if ftw x then x:xs else []
-- myTakeWhile ftw list_of_x = foldr (gen_fr ftw) ([]::[a]) list_of_x
-- and, single line implementation would be
myTakeWhile2 ftw list_of_x = foldr (\x xs -> if ftw x then x:xs else []) ([]) list_of_x


data Bintree a = Node a (Bintree a) (Bintree a) | Leaf a
bot = bot
let f ˜(Node 1 t1 t2) = t1 in f (Node 2 (Leaf 1)(Leaf 2))
