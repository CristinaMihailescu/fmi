-- Informatics 1 - Functional Programming 
-- Declarative Programming 
-- Lab 5

import Data.Char
import Test.QuickCheck



-- 1. Map
-- a. (4 simboluri)
uppers :: String -> String
uppers = undefined

-- b. (7 simboluri)
doubles :: [Int] -> [Int]
doubles = undefined

-- c. (10 simboluri)
penceToPounds :: [Int] -> [Float]
penceToPounds = undefined

-- d. (11 simboluri)
uppers' :: String -> String
uppers' = undefined

-- (8 simboluri)
prop_uppers :: String -> Bool
prop_uppers = undefined



-- 2. Filter
-- a. (4 simboluri)
alphas :: String -> String
alphas = undefined

-- b. (8 simboluri)
rmChar ::  Char -> String -> String
rmChar = undefined

-- c. (8 simboluri)
above :: Int -> [Int] -> [Int]
above = undefined

-- d. (13 simboluri)
unequals :: [(Int,Int)] -> [(Int,Int)]
unequals = undefined

-- e. (15 simboluri)
rmCharComp :: Char -> String -> String
rmCharComp = undefined

-- (11 simboluri)
prop_rmChar :: Char -> String -> Bool
prop_rmChar = undefined



-- 3. Comprehensions vs. map & filter
-- a. 
upperChars :: String -> String
upperChars s = [toUpper c | c <- s, isAlpha c]

-- (7 simboluri)
upperChars' :: String -> String
upperChars' = undefined

prop_upperChars :: String -> Bool
prop_upperChars s = upperChars s == upperChars' s

-- b. 
largeDoubles :: [Int] -> [Int]
largeDoubles xs = [2 * x | x <- xs, x > 3]

-- (13 simboluri)
largeDoubles' :: [Int] -> [Int]
largeDoubles' = undefined

prop_largeDoubles :: [Int] -> Bool
prop_largeDoubles xs = largeDoubles xs == largeDoubles' xs 

-- c.
reverseEven :: [String] -> [String]
reverseEven strs = [reverse s | s <- strs, even (length s)]

-- (11 simboluri)
reverseEven' :: [String] -> [String]
reverseEven' = undefined

prop_reverseEven :: [String] -> Bool
prop_reverseEven strs = reverseEven strs == reverseEven' strs



-- 4. Foldr
-- a.
productRec :: [Int] -> Int
productRec []     = 1
productRec (x:xs) = x * productRec xs

-- (7 simboluri)
productFold :: [Int] -> Int
productFold = undefined

prop_product :: [Int] -> Bool
prop_product xs = productRec xs == productFold xs

-- b.  (16 simboluri)
andRec :: [Bool] -> Bool
andRec = undefined

-- (7 simboluri)
andFold :: [Bool] -> Bool
andFold = undefined

prop_and :: [Bool] -> Bool
prop_and xs = andRec xs == andFold xs 

-- c.  (17 simboluri)
concatRec :: [[a]] -> [a]
concatRec = undefined

-- (8 simboluri)
concatFold :: [[a]] -> [a]
concatFold = undefined

prop_concat :: [String] -> Bool
prop_concat strs = concatRec strs == concatFold strs

-- d.  (17 simboluri)
rmCharsRec :: String -> String -> String
rmCharsRec = undefined

-- (6 simboluri)
rmCharsFold :: String -> String -> String
rmCharsFold = undefined

prop_rmChars :: String -> String -> Bool
prop_rmChars chars str = rmCharsRec chars str == rmCharsFold chars str



type Matrix = [[Int]]


-- 5
-- a. (10 simboluri)
uniform :: [Int] -> Bool
uniform = undefined

-- b. (	 simboluri)
valid :: Matrix -> Bool
valid = undefined

-- 6.

-- 7.  (22 simboluri + 19 simboluri)  cu tot cu tratarea erorilor
plusM :: Matrix -> Matrix -> Matrix
plusM = undefined

-- 8. (23 simboluri + 15 simboluri)  cu tot cu tratarea erorilor  
timesM :: Matrix -> Matrix -> Matrix
timesM = undefined

