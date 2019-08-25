

module TestEq where

data Trivial = Trivial' | Trivial'' deriving Show

instance Eq Trivial where
    (==) Trivial' Trivial' = True
    (==) Trivial'' Trivial'' = True
    (==) _ _ = False

data DayOfWeek =
    Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show
instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False


-- remember to do
    -- :set -Wall
    -- in the GHCi
data Date =
    Date' DayOfWeek Int deriving Show
-- above, Date' is the Data constructor. We could have named it Date (i.e. same as Type Constructor aka Type name) but 
-- chose a separate name to show we use the data constructor. Here, the data constructor is not a value but a function that
-- takes 2 arguments: the DayOfWeek and some Int. i.e. Date' :: DayOfWeek -> Int -> Date
-- so, after we declare this data type (i.e. Date), to create instances of this type, we always have to invoke the data constructor
-- ... Date'. e.g. Date' Mon 14

instance Eq Date where
    (==) (Date' dow d) (Date' dow' d') = (dow == dow') && (d == d')

fstG g1 g2 = g1

fstD :: Date -> Date -> Date
fstD d1 d2 = d1

fstDow :: Date -> DayOfWeek
fstDow (Date' dow i) = dow

data Identity a =
    Identity a

instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'

data NoEq = NoEqInst deriving Show


-- Exercises
-- write Eq instances for
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
    (==) (TisAn a) (TisAn a') = a == a'

data TwoIntegers =
    Two Integer Integer

instance Eq TwoIntegers where
    (==) (Two a b) (Two a' b') = (a == a') && (b == b')

data StringOrInt =
    TisAnInt Int
    | TisAString String

instance Eq StringOrInt where
    (==) (TisAnInt a) (TisAnInt b) = a == b
    (==) (TisAString a) (TisAString b) = a == b
    (==) _ _ = False

    -- in the first line below, the type constructor "Pair" takes a type variable "a" as an argument
    -- in the 2nd line below, the data constructor (also called "Pair") takes two arguments, both of the samr type "a"
data Pair a =
    Pair a a deriving Show


    -- in the Eq instance definition below, the first line has type level variables... 
    --  so, here Pair is the type constructor and "a" is a type variable
    --  and in the 2nd line, Pair is a data constructor function that takes two args "a" and "b", 
    --  both of the same type "a" defined in the first line.

instance Eq a => Eq (Pair a) where
    (==) (Pair a b) (Pair a' b') = (a == a') && (b == b')


data Tuple a b =
    Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple x y) (Tuple x' y') = (x == x') && (y == y')

data Which a =
    ThisOne a
    | ThatOne a

instance Eq a => Eq (Which a) where
    (==) (ThisOne x) (ThisOne x') = x == x'
    (==) (ThisOne x) (ThatOne x') = x == x'
    (==) (ThatOne x) (ThisOne x') = x == x'
    (==) (ThatOne x) (ThatOne x') = x == x'

data EitherOr a b =
    Hello a
    | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello x) (Hello x') = (x == x')
    (==) (Goodbye x) (Goodbye x') = (x == x')
    (==) _ _ = False

