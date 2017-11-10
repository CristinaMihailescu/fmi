-- Declarative Programming
-- Lab 3
--

import           Data.Char
import           Data.List
import           Test.QuickCheck



-- 1. halveEvens

-- List-comprehension version
halveEvens :: [Int] -> [Int]
halveEvens xs = [div x 2 | x<-xs, mod x 2 == 0]

-- Recursive version
halveEvensRec :: [Int] -> [Int]
halveEvensRec [] = []
halveEvensRec (x:xs) = if mod x 2 == 0 then div x 2 : halveEvensRec xs
                       else halveEvensRec xs

-- Mutual test
prop_halveEvens :: [Int] -> Bool
prop_halveEvens xs = halveEvens xs == halveEvensRec xs



-- 2. inRange

-- List-comprehension version
inRange :: Int -> Int -> [Int] -> [Int]
inRange lo hi xs = [x | x<-xs, lo <= x, x <= hi]

-- Recursive version
inRangeRec :: Int -> Int -> [Int] -> [Int]
inRangeRec _ _ [] = []
inRangeRec lo hi (x:xs) = if lo <= x && x <= hi then x : (inRangeRec lo hi xs)
                    else inRangeRec lo hi xs

-- Mutual test
prop_inRange :: Int -> Int -> [Int] -> Bool
prop_inRange lo hi xs = inRange lo hi xs == inRangeRec lo hi xs



-- 3. sumPositives: sum up all the positive numbers in a list

-- List-comprehension version
countPositives :: [Int] -> Int
countPositives xs = length [x | x<-xs, x > 0]

-- Recursive version
countPositivesRec :: [Int] -> Int
countPositivesRec [] = 0
countPositivesRec (x:xs) = if x > 0 then 1 + (countPositivesRec xs)
                           else countPositivesRec xs

-- Mutual test
prop_countPositives :: [Int] -> Bool
prop_countPositives xs = countPositives xs == countPositivesRec xs



-- 4. pennypincher

-- Helper function
discount :: Integer -> Integer
discount x = x - round(fromInteger(div (fromInteger x) 10))

-- List-comprehension version
pennypincher :: [Integer] -> Integer
pennypincher xs = sum [discount x | x<-xs, discount x <= 19900]

-- Recursive version
pennypincherRec :: [Integer] -> Integer
pennypincherRec [] = 0
pennypincherRec (x:xs) = if discount x <= 19900 then discount x + pennypincherRec xs
                         else pennypincherRec xs

-- Mutual test
prop_pennypincher :: [Integer] -> Bool
prop_pennypincher xs = pennypincher xs == pennypincherRec xs



-- 5. sumDigits

-- List-comprehension version
multDigits :: String -> Int
multDigits xs = product [digitToInt x | x<-xs, isDigit x]

-- Recursive version
multDigitsRec :: String -> Int
multDigitsRec [] = 1
multDigitsRec (x:xs) = if isDigit x then digitToInt x * multDigitsRec xs
                       else multDigitsRec xs

-- Mutual test
prop_multDigits :: String -> Bool
prop_multDigits xs = multDigits xs == multDigitsRec xs



-- 6. capitalise

-- List-comprehension version
capitalise :: String -> String
capitalise [] = []
capitalise (x:xs) = [toUpper x] ++ [toLower y | y<-xs]

-- Recursive version
capitaliseRecHelper :: String -> String
capitaliseRecHelper [] = []
capitaliseRecHelper (x:xs) = [toLower x] ++ capitaliseRecHelper xs

capitaliseRec :: String -> String
capitaliseRec [] = []
capitaliseRec (x:xs) = [toUpper(x)] ++ capitaliseRecHelper(xs)

-- Mutual test
prop_capitalise :: String -> Bool
prop_capitalise xs = capitalise xs == capitaliseRec xs



-- 7. title

-- List-comprehension version
titleHelper :: String -> String
titleHelper x = if length x >= 4 then capitalise x
                else [toLower y | y<-x]

title :: [String] -> [String]
title [] = []
title (y:xs) = [capitalise y] ++ [titleHelper x | x<-xs]

-- Recursive version
titleRecHelper :: [String] -> [String]
titleRecHelper [] = []
titleRecHelper (x:xs) = [titleHelper x] ++ titleRecHelper xs

titleRec :: [String] -> [String]
titleRec [] = []
titleRec (x:xs) = [capitalise x] ++ titleRecHelper xs

-- mutual test
prop_title :: [String] -> Bool
prop_title xs = title xs == titleRec xs

