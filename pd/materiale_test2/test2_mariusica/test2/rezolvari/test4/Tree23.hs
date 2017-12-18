

-- Ex 1 a)
module Tree23 (Tree23, contains, toList, count3, insert, fromList, myTree) where

data Tree23 a = Empty
                | Node2 (Tree23 a) a (Tree23 a)
                | Node3 (Tree23 a) a (Tree23 a) a (Tree23 a)
                | Node4 (Tree23 a) a (Tree23 a) a (Tree23 a) a (Tree23 a)
                -- acest ultim nod este folosit ca nod auxiliar pt functia
                -- insert (nu afecteaza restul exercitiilor)
                deriving Show


myTree :: Tree23 Int
myTree = (Node3 (Node3 (Node3 Empty 10 Empty 20 Empty) 30
                       (Node3 Empty 32 Empty 34 Empty) 35
                       (Node2 Empty 36 Empty)
                ) 37
                (Node2 (Node2 Empty 38 Empty) 39 (Node2 Empty 40 Empty)) 50
                (Node3 (Node2 Empty 60 Empty) 70
                (Node2 Empty 80 Empty) 90 (Node2 Empty 100 Empty)))
-- ascii art (dupa 2 ore am vazut desenu' in pdf :/ )
--                (37                  ,                 50)
--                 /                   |                  \ 
--        (30    ,     35)             39            (70  ,    90)
--    /          |       \           /   \         /      |    \
-- (10, 20)   (32, 34)   36         38   40       60     80   100
--   /|\       /|\       /\        /\    /\      /\     /\    /\


-- varianta initiala
--                       37                                   50
--              n3                       n2                   n3
--        30          35                 39            70           90
--   n3        n3         n2        n2        n2    n3    n2        n2
-- 10  20    32  34       36        n2        40   n2     80       100
--                                  38             60


-- Ex 2 a)
contains :: Eq a => a -> Tree23 a -> Bool
contains _ Empty = False
contains a (Node2 l x r) | a == x = True
                         | otherwise = contains a l || contains a r
contains a (Node3 l x c y r)
        | a == x || a == y = True
        | otherwise = contains a l || contains a c || contains a r
-- contains 39 myTree == True
-- contains 7 myTree == False


-- Ex 2 b)
toList :: Tree23 a -> [a]
toList Empty = []
toList (Node2 l x r) = toList l ++ [x] ++ toList r
toList (Node3 l x c y r) = toList l ++ [x] ++ toList c ++ [y] ++ toList r
-- toList myTree == [10,20,30,32,34,35,36,37,38,39,40,50,60,70,80,90,100]


-- Ex 2 c)
count3 :: Integral b => Tree23 a -> b
count3 Empty = 0
count3 (Node2 l x r) = count3 l + count3 r
count3 (Node3 l x c y r) = 1 + count3 l + count3 c + count3 r
-- count3 myTree == 5


-- Ex 2 d) incomplet
insert :: Ord a => a -> Tree23 a -> Tree23 a
insert a Empty = Node2 Empty a Empty
insert a t@(Node2 Empty b Empty)
     | a == b = t
     | a < b = (Node2 (Node2 Empty a Empty) b Empty)
     | otherwise = (Node2 Empty b (Node2 Empty a Empty))

insert a t@(Node2 l@(Node2 Empty b Empty) c Empty)
     | a == b || a == c = t
     | a < b = Node2 (Node2 Empty a Empty) b (Node2 Empty c Empty)
     | a < c = Node2 (Node2 Empty b Empty) a (Node2 Empty c Empty)
     | otherwise = Node2 (Node2 Empty b Empty) c (Node2 Empty a Empty)
     
insert a t@(Node2 Empty b r@(Node2 Empty c Empty))
     | a == b || a == c = t
     | a < b = Node2 (Node2 Empty a Empty) b (Node2 Empty c Empty)
     | a < c = Node2 (Node2 Empty b Empty) a (Node2 Empty c Empty)
     | otherwise = Node2 (Node2 Empty b Empty) c (Node2 Empty a Empty)


-- nod2 cu fii nod 2
insert a t@(Node2 l@(Node2 Empty b Empty) x r@(Node2 Empty c Empty))
     | a == x || a == b || a == c = t
     | a < b = Node2 (Node3 Empty a Empty b Empty) x r
     | a < x = Node2 (Node3 Empty b Empty a Empty) x r
     | a < c = Node2 l x (Node3 Empty a Empty c Empty)
     | otherwise = Node2 l x (Node3 Empty c Empty a Empty)
-- nod2 cu fii nod2 si nod3
insert a t@(Node2 l@(Node2 _ _ _) x r@(Node3 Empty b Empty c Empty))
     | a == x || a == b || a == c = t
     | a < x = Node2 (insert a l) x r
     | a < b = split2 (Node2 l x (Node4 Empty a Empty b Empty c Empty))
     | a < c = split2 (Node2 l x (Node4 Empty b Empty a Empty c Empty))
     | otherwise = split2 (Node2 l x (Node4 Empty b Empty c Empty a Empty))
-- nod2 cu fii nod3 si nod2
insert a t@(Node2 l@(Node3 Empty b Empty c Empty) x r@(Node2 _ _ _))
     | a == x || a == b || a == c = t
     | a > x = Node2 l x (insert a r)
     | a < b = split2 (Node2 (Node4 Empty a Empty b Empty c Empty) x r)
     | a < c = split2 (Node2 (Node4 Empty b Empty a Empty c Empty) x r)
     | otherwise = split2 (Node2 (Node4 Empty b Empty c Empty a Empty) x r)
-- nod2 cu fii nod3 si nod3
insert a t@(Node2 l@(Node3 Empty b Empty c Empty) x r@(Node3 Empty d Empty e Empty))
     | a == x || a == b || a == c || a == d || a == e = t
     | a < b = split2 (Node2 (Node4 Empty a Empty b Empty c Empty) x r)
     | a < c = split2 (Node2 (Node4 Empty b Empty a Empty c Empty) x r)
     | a < d = split2 (Node2 l x (Node4 Empty a Empty d Empty e Empty))
     | a < e = split2 (Node2 l x (Node4 Empty d Empty a Empty e Empty))
     | otherwise = split2 (Node2 l x (Node4 Empty b Empty c Empty a Empty))


insert a t@(Node3 l x c y r) | a == x || a == y = t
                             | a < x = Node3 (insert a l) x c y r
                             | a < y = Node3 l x (insert a c) y r
                             | otherwise = Node3 l x c y (insert a r)


-- Ex 2 e)
fromList :: Ord a => [a] -> Tree23 a
fromList = foldr insert Empty


-- helper functions
split2 :: Ord a => Tree23 a -> Tree23 a
split2 (Node2 l x (Node4 Empty a Empty b Empty c Empty))
    = (Node3 l (min x b) (Node2 Empty a Empty) (max x b) (Node2 Empty c Empty))
--      | x < b = (Node3 l x (Node2 Empty a Empty) b (Node2 Empty c Empty))
--      | otherwise = (Node3 l b (Node2 Empty a Empty) x (Node2 Empty c Empty))
split2 (Node2 (Node4 Empty a Empty b Empty c Empty) x r)
    = (Node3 (Node2 Empty a Empty) (min x b) (Node2 Empty c Empty) (max x b) r)
split2 t = t


