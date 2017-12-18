import Data.Monoid

data Dom a = Empty
            | Full
            | Ran a a
            | (Dom a) :|: (Dom a)
            | (Dom a) :&: (Dom a)
            deriving (Show, Ord)


-- Ex 1
instance Eq a => Eq (Dom a) where
    Ran a b == Ran c d = a == c && b == d || a == d && b == c
-- sau min a b == min c d && max a b == max c d
-- dar asa trebuie adaugat constrangerea Ord a, pe langa Eq a (si posibil
-- sa vrea cu paranteze)


-- Ex 2
exist :: Ord a => a -> Dom a -> Bool
exist _ Empty = False
exist _ Full = True
exist val (Ran a b) = val >= a && val <= b
exist val (a :|: b) = exist val a || exist val b
exist val (a :&: b) = exist val a && exist val b


-- Ex 3
overlap :: Ord a => Dom a -> Dom a -> Bool
overlap Empty _ = False
overlap _ Empty = False
overlap Full _ = True
overlap _ Full = True
--overlap (Ran a b) (Ran c d) = a >= c && a <= d ||
--                              b >= c && b <= d ||
--                              c >= a && c <= b ||
--                              d >= a && d <= b
overlap r@(Ran a b) s@(Ran c d) = exist a s || exist b s
                               || exist c r || exist d r
overlap _ _ = False


-- Ex 4
normalize :: Dom a -> Dom a
--normalize Empty = Empty
--normalize Full = Full
normalize ((a :|: b) :&: c) = (normalize a :&: normalize c) :|:
                              (normalize b :&: normalize c)
normalize (c :&: (a :|: b)) = (normalize a :&: normalize c) :|:
                              (normalize b :&: normalize c)
normalize (a :|: b) = normalize a :|: normalize b
normalize (a :&: b) = normalize a :&: normalize b
normalize a = a


-- Ex 5
newtype SDom a = SDom (Dom a)
                 deriving (Eq, Ord, Show)
                 
newtype PDom a = PDom (Dom a)
                 deriving (Eq, Ord, Show)
                 
instance Monoid (SDom a) where
    mempty = SDom Empty
    mappend (SDom x) (SDom y) = SDom (x :|: y)

instance Monoid (PDom a) where
    mempty = PDom Full
    mappend (PDom x) (PDom y) = PDom (x :&: y)


-- Ex 6
optimize :: Ord a => Dom a -> Dom a
optimize Empty = Empty
optimize Full = Full
optimize x@(Ran _ _) = x
optimize (Empty :|: a) = optimize a
optimize (Full :|: a) = Full
optimize (Empty :&: a) = Empty
optimize (Full :&: a) = optimize a
optimize (a :|: Empty) = optimize a
optimize (a :|: Full) = Full
optimize (a :&: Empty) = Empty
optimize (a :&: Full) = optimize a
optimize (x@(Ran a b) :|: y@(Ran c d))
     | overlap x y = Ran (min a c) (max b d)
     | otherwise = x :|: y
optimize (x@(Ran a b) :&: y@(Ran c d))
     | overlap x y = Ran (max a c) (min b d)
     | otherwise = Empty
optimize (a :|: b) = optimize (optimize a :|: optimize b)
optimize (a :&: b) = optimize (optimize a :&: optimize b)
-- optimize ((Ran 1 5 :&: Ran 0 7) :|: (Ran 3 9 :&: Ran 0 7)) :|: ((Ran 8 11 :&: Ran 9 14) :|: Empty)
-- in exemplu este gresit, este :|: in loc de :&:


-- Ex 7
data DomF a = EmptyF
              | RanF a a
              | (DomF a) ::| (DomF a)
              deriving Show
              
-- ne facem intai monoidul
instance Monoid (DomF a) where
    mempty = EmptyF
    mappend = (::|)

instance Foldable DomF where
    foldMap f EmptyF = mempty
    foldMap f (a ::| b) = foldMap f a <> foldMap f b
-- nu stiu cum testezi asa ceva...


-- Ex 8
data Bin a = Leaf a
             | Node (Bin a) (Bin a)

-- a)
fmap' :: (a -> b -> b) -> b -> Bin a -> b
fmap' f i (Leaf x) = f x i
fmap' f i (Node l r) = fmap' f (fmap' f i r) l

instance Foldable Bin where
    foldr = fmap'

-- b)
sum :: Bin (SDom a) -> SDom a
sum = fmap' (<>) (SDom Empty)

prod :: Bin (PDom a) -> PDom a
prod = fmap' (<>) (PDom Full)

-- let intv = ((Ran 1 5 :&: Ran 0 7) :|: (Ran 3 9 :&: Ran 0 7)) :|: ((Ran 8 11 :&: Ran 9 14) :|: Empty)
-- Main.sum (Node(Node(Leaf(SDom Empty))(Leaf(SDom Empty)))(Leaf(SDom intv)))

-- helper functions
fromS :: SDom a -> Dom a
fromS (SDom a) = a

fromP :: PDom a -> Dom a
fromP (PDom a) = a

-- o fi ok?
-- optimize $ fromS $ Main.sum (Node(Node(Leaf(SDom Empty))(Leaf(SDom Empty)))(Leaf(SDom Empty)))


