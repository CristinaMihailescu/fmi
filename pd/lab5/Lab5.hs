-- Informatics 1 - Functional Programming 
-- Declarative Programming 
-- Lab 5

import Data.Char
import Test.QuickCheck



-- 1. Map
-- a. (4 simboluri)
uppers :: String -> String
uppers xs = map toUpper xs

-- b. (7 simboluri)
doubles :: [Int] -> [Int]
doubles xs = map (\x -> 2*x) xs

-- c. (10 simboluri)
penceToPounds :: [Integer] -> [Float]
penceToPounds xi = map (\x -> realToFrac x / 100) xi --HELLLLLLLLLLOOOOOOOOOOOOOOOOOOOO

-- d. (11 simboluri)
uppers' :: String -> String
uppers' = undefined

-- (8 simboluri)
prop_uppers :: String -> Bool
prop_uppers = undefined



-- 2. Filter
-- a. (4 simboluri)
alphas :: String -> String
alphas xs = filter isAlpha xs

-- b. (8 simboluri)
rmChar ::  Char -> String -> String
rmChar c xs = filter (/= c) xs

-- c. (8 simboluri)
above :: Int -> [Int] -> [Int]
above m xi = filter (> m) xi

-- d. (13 simboluri)
unequals :: [(Int,Int)] -> [(Int,Int)]
unequals xi = filter (\(x, y) -> x /= y) xi

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
upperChars' xs = map toUpper(filter isAlpha xs)

prop_upperChars :: String -> Bool
prop_upperChars s = upperChars s == upperChars' s

-- b. 
largeDoubles :: [Int] -> [Int]
largeDoubles xs = [2 * x | x <- xs, x > 3]

-- (13 simboluri)
largeDoubles' :: [Int] -> [Int]
largeDoubles' xs = map (* 2) (filter (> 3) xs)

prop_largeDoubles :: [Int] -> Bool
prop_largeDoubles xs = largeDoubles xs == largeDoubles' xs 

-- c.
reverseEven :: [String] -> [String]
reverseEven strs = [reverse s | s <- strs, even (length s)]

-- (11 simboluri)
reverseEven' :: [String] -> [String]
reverseEven' xs = map reverse (filter (even.length) xs)

prop_reverseEven :: [String] -> Bool
prop_reverseEven strs = reverseEven strs == reverseEven' strs



-- 4. Foldr
-- a.
productRec :: [Int] -> Int
productRec []     = 1
productRec (x:xs) = x * productRec xs

-- (7 simboluri)
productFold :: [Int] -> Int
productFold xi = foldr (*) 1 xi

prop_product :: [Int] -> Bool
prop_product xs = productRec xs == productFold xs

-- b.  (16 simboluri)
andRec :: [Bool] -> Bool
andRec = undefined

-- (7 simboluri)
andFold :: [Bool] -> Bool
andFold xb = foldr (&&) True xb

prop_and :: [Bool] -> Bool
prop_and xs = andRec xs == andFold xs 

-- c.  (17 simboluri)
concatRec :: [[a]] -> [a]
concatRec = undefined

-- (8 simboluri)
concatFold :: [[a]] -> [a]
concatFold xs = foldr (++) [] xs

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
uniform xi = all (== head xi) xi

-- b. (	 simboluri)
valid :: Matrix -> Bool
valid xi = uniform (map length xi) && (length (head xi)) > 0 && length xi > 0

-- 6.

-- 7.  (22 simboluri + 19 simboluri)  cu tot cu tratarea erorilor
plusM :: Matrix -> Matrix -> Matrix
plusM m1 m2 = if valid m1 && valid m2 then zipWith(zipWith (+)) m1 m2
              else error "Invalid input"

-- 8. (23 simboluri + 15 simboluri)  cu tot cu tratarea erorilor  
timesM :: Matrix -> Matrix -> Matrix
timesM = undefined

