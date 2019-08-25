import Data.List -- imported sort from Data.List (needed for some other code further below)

data Mood = Blah
    | Woot deriving (Show, Eq, Ord) -- originally: deriving Show

settleDown x = if x == Woot
                then Blah
                else x

-- --------------------------------------
type Subject = String
type Verb = String
type Object = String

data Sentence =
    Sentence Subject Verb Object
    deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

-- --------------------------------------

data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah  -- note: in this line: Rocks and Yeah are being used as Type names (aka Type constructors, not data constructors, however Papu is the data constructor)
    deriving (Eq, Show)

-- phew = Papu "chases" True -- this line will fail
-- next line is fixed line
phew = Papu (Rocks "chases") (Yeah True)

truth = Papu (Rocks "chomskydoz") -- this will load just fine
                (Yeah True)

equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p -- this will work just fine as we've already derived eq for Papu, Rocks and Yeah types

comparePapus :: Papu -> Papu -> Bool
comparePapus = undefined
-- comparePapus p p' = p > p' -- will fail typecheck is none of Rocks, Yeah and Papu have an Ord instance, but we are trying to use (>)


jung :: Ord a => [a] -> a
jung xs = head (sort xs)

young :: [Char] -> Char
young xs = head (sort xs)

mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk fnXtoY x y = fnXtoY(x) == y

arith :: Num b
    => (a -> b)
    -> Integer
    -> a
    -> b
arith fnXtoY z x = fromInteger(z) + fnXtoY x

