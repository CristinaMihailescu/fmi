-- INF 1 Functional Programming
-- 
-- Indexed data represented as a tree


module KeymapTree ( Keymap,
                    size, depth,
                    get, set, 
                    toList, fromList,
					filterLT,
					filterGT,
					merge,
					del,
					select
                  )

where

-- Modules for testing

import Test.QuickCheck
import Control.Monad
import Data.List

-- The data type

data Keymap k a = Leaf
                | Node k a (Keymap k a) (Keymap k a)

-- A test tree

testTree :: Keymap Int Int
testTree = Node 2 20 (Node 1 10 Leaf Leaf)
                     (Node 3 30 Leaf 
                               (Node 4 40 Leaf Leaf ))

-- Exercise 6

size :: Ord k => Keymap k a -> Int
size Leaf = 0
size (Node _ _ left right) = 1 + size left + size right

depth :: Ord k => Keymap k a -> Int
depth Leaf = 0
depth (Node _ _ left right) = 1 + maximum [depth left, depth right]

-- Exercise 7

toList :: Ord k => Keymap k a -> [(k,a)]
toList Leaf = []
toList (Node k a left right) = (toList left) ++ [(k,a)] ++ (toList right)

-- Exercise 8

set :: Ord k => k -> a -> Keymap k a -> Keymap k a
set key value = f
    where
      f Leaf = Node key value Leaf Leaf
      f (Node k v left right) | key == k  = Node k value left right
                              | key <= k  = Node k v (f left) right
                              | otherwise = Node k v left (f right)

-- Exercise 9

get :: Ord k => k -> Keymap k a -> Maybe a
get key = f
    where
      f Leaf = Nothing
      f (Node k v left right) | key == k  = Just v
                              | key <= k  = f left
                              | otherwise = f right

prop_set_get :: Int -> Int -> Bool
prop_set_get k v = get k (set k v testTree) == Just v

-- Exercise 10
insertIntoTree :: Ord k => [(k,a)] -> Keymap k a -> Keymap k a
insertIntoTree [] tree = tree
insertIntoTree (x:xs) tree = set (fst x) (snd x) (insertIntoTree xs tree)


fromList :: Ord k => [(k,a)] -> Keymap k a
fromList xs = insertIntoTree xs Leaf


prop_toList_fromList :: [Int] -> [Int] -> Bool
prop_toList_fromList xs ys = sort (toList (fromList zs)) == sort zs
    where
      zs = zip (nub xs) ys

prop_toList_fromList_sorted :: [Int] -> [Int] -> Bool
prop_toList_fromList_sorted xs ys = toList (fromList zs) == sort zs
    where
      zs = zip (nub xs) ys

-- Optional Material -----------------------------------

-- Exercise 12

filterLT :: Ord k => k -> Keymap k a -> Keymap k a
filterLT k Leaf = Leaf
filterLT k (Node key value left right)
 |key > k = filterLT k left
 |otherwise = Node key value left (filterLT k right)

filterGT :: Ord k => k -> Keymap k a -> Keymap k a
filterGT k Leaf = Leaf
filterGT k (Node key value left right)
 |key < k = filterGT k right
 |otherwise = Node key value (filterGT k left) right

-- Exercise 13
merge :: Ord k => Keymap k a -> Keymap k a -> Keymap k a
merge tree1 tree2 = fromList ((toList tree1) ++ (toList tree2))
-- aici complexitatea e O(nlogn) si ar fi mai mica cu recursie

delDuplicates :: Ord k => [(k,a)] -> [(k,a)]
delDuplicates [] = []
delDuplicates (x:[]) = x : []
delDuplicates (x:y:[])
 |fst x == fst y = x : []
 |otherwise = x : y : []
delDuplicates (x:y:xs)
 |fst x == fst y = x : delDuplicates xs
 |otherwise = x : y : delDuplicates xs

isEqualTo :: Ord k => [(k,a)] -> [(k,a)] -> Bool
isEqualTo [] [] = True
isEqualTo [] ys = False
isEqualTo xs [] = False
isEqualTo (x:xs) (y:ys) = (fst x) == (fst y) && (isEqualTo xs ys)

mySort :: Ord k => (k,a) -> (k,a) -> Ordering
mySort (k1,v1) (k2,v2)
 |k1 < k2 = LT
 |otherwise = GT

prop_merge :: Ord k => Keymap k a -> Keymap k a -> Bool
prop_merge tree1 tree2 = delDuplicates ((sortBy mySort ((toList tree1) ++ (toList tree2)))) `isEqualTo` delDuplicates((toList (merge tree1 tree2)))

-- Exercise 14

del :: Ord k => k -> Keymap k a -> Keymap k a
del key tree = merge (filterLT key tree) (filterGT key tree)

-- Exercise 15

select :: Ord k => (a -> Bool) -> Keymap k a -> Keymap k a
select pred = f
    where
      f Leaf = Leaf
      f (Node k v left right) | pred v == True = Node k v (f left) (f right)
                              | otherwise = f (merge left right)
	  
	  
-- Instances for QuickCheck -----------------------------
instance (Ord k, Show k, Show a) => Show (Keymap k a) where
    show = show . toList

instance (Ord k, Arbitrary k, Arbitrary a) => Arbitrary (Keymap k a) where
    arbitrary = liftM fromList $ liftM2 zip (liftM nub arbitrary) arbitrary
