import Data.Monoid

data Dom a = Empty
           | Full
           | Ran a a
           | (Dom a) :|: (Dom a)
           | (Dom a) :&: (Dom a)
           deriving (Show, Ord)

instance Eq a => Eq (Dom a) where
    Ran a b == Ran c d = (a == c && b == d) || (a == d && b == c)

exist :: Ord a => a -> Dom a -> Bool
exist x Empty = False
exist x Full = True
exist x (Ran a b) = a <= x && x <= b
exist x (a :|: b) = x `exist` a || x `exist` b
exist x (a :&: b) = x `exist` a && x `exist` b

overlap :: Ord a => Dom a -> Dom a -> Bool
overlap (Ran a b) (Ran c d) = (a <= c && c <= b) ||
                              (c <= a && b <= d) ||
                              (a <= d && d <= b) ||
                              (a <= c && d <= b)
overlap _ Full = True
overlap Full _ = True
overlap _ Empty = False
overlap Empty _ = False
overlap _ _ = False

normalize :: Dom a -> Dom a
normalize ((a :|: b) :&: c) = (a :&: c) :|: (b :&: c)
normalize (c :&: (a :|: b)) = (c :&: a) :|: (c :&: b)
normalize (a :|: b) = normalize a :|: normalize b
normalize (a :&: b) = normalize a :&: normalize b
normalize a = a

newtype OrDom a = OrDom (Dom a)
        deriving (Eq, Ord, Show)

newtype AndDom a = AndDom (Dom a)
        deriving (Eq, Ord, Show)

instance Monoid (OrDom a) where
    mempty = OrDom Empty
    (OrDom x) `mappend` (OrDom y) = OrDom (x :|: y)

instance Monoid (AndDom a) where
    mempty = AndDom Empty
    (AndDom x) `mappend` (AndDom y) = AndDom (x :&: y)

optimize :: Ord a => Dom a -> Dom a
optimize Empty = Empty
optimize Full = Full
optimize (Ran a b) = Ran a b
optimize (a :|: Empty) = optimize a
optimize (Empty :|: a) = optimize a
optimize (_ :|: Full) = Full
optimize (Full :|: _) = Full
optimize (_ :&: Empty) = Empty
optimize (Empty :&: _) = Empty
optimize (a :&: Full) = optimize a
optimize (Full :&: a) = optimize a
optimize ((Ran a b) :|: (Ran c d)) = if Ran a b `overlap` Ran c d then Ran (min a c) (max b d)
                                         else Ran a b :|: Ran c d
optimize ((Ran a b) :&: (Ran c d)) = if Ran a b `overlap` Ran c d then Ran (max a c) (min b d)
                                         else Ran a b :&: Ran c d
optimize (a :|: b) = optimize (optimize a :|: optimize b)
optimize (a :&: b) = optimize (optimize a :&: optimize b)

---ex 7

data DomF a = Empty
            | Ran a a
            | (DomF a) :|: (DomF a)
            deriving Show
instance Monoid (DomF a) where
    mempty = Empty
    mappend = (:|:)

instance Foldable DomF where
    foldMap f Empty = mempty
    foldMap f (a :|: b) = foldMap f a <> foldMap f b

---ex 8

data Bin a = Empty
           | Leaf a
           | Node (Bin a) (Bin a)
           deriving Show

fmap :: (a -> b -> b) -> Bin a -> b
fmap f i (Leaf x) = f x i
fmap f i (Node l r) = fmap f (fmap f i r) l