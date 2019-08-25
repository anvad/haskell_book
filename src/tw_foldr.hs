module Tw where
import Debug.Trace

-- ftw :: Integer -> Bool
-- ftw x = x > 0
-- fr x xs = trace ("xs= " ++ show xs ++ ", x= " ++ show x) $ if ftw x then x:xs else []

-- a x = takeWhile ftw x
-- b x = foldr fr ([]::[Integer]) x

-- list = [-1, 1, 2, 0, 4]
-- a list
-- b list

-- ftw :: a -> Bool; ftw = undefined; gen_fr ftw x xs = if ftw x then x:xs else []; fr = gen_fr ftw
-- the following two line implementation works
-- gen_fr ftw x xs = if ftw x then x:xs else []
-- myTakeWhile ftw list_of_x = foldr (gen_fr ftw) ([]::[a]) list_of_x

-- so, single line implementation would be
myTakeWhile ftw list_of_x = foldr (\x xs -> if ftw x then x:xs else []) ([]) list_of_x
