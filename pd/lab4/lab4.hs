-- Declarative Programming
-- Lab 4
--


import Data.Char
import Data.List
import Test.QuickCheck


-- 1.
rotate :: Int -> [Char] -> [Char]
rotate n xs = if n < 0 || n > (length xs) then "error"
              else if n == 0 then xs
                   else rotate (n-1) ((tail xs) ++ [head xs])

-- 2.
prop_rotate :: Int -> String -> Bool
prop_rotate k str = rotate (l - m) (rotate m str) == str
                        where l = length str
                              m = if l == 0 then 0 else k `mod` l

-- 3. 
makeKey :: Int -> [(Char, Char)]
makeKey n = [(a, b) | a <- "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                      let b = if (ord a) + n <= 90 then chr((ord a) + n)
                              else chr(64 + mod ((ord a) + n) 90)]

-- 4.
lookUp :: Char -> [(Char, Char)] -> Char
lookUp c [] = c
lookUp c ((v, k):xs) = if c == v then k
                       else lookUp c xs

-- 5.
encipher :: Int -> Char -> Char
encipher n a = if (ord a) + n <= 90 then chr((ord a) + n)
               else chr(64 + mod ((ord a) + n) 90)

-- 6.
normalize :: String -> String
normalize xs = filter norm (map toUpper xs)
          where norm x = isDigit x || isAlpha x

-- 7.
encipherStr :: Int -> String -> String
encipherStr n xs = map f (normalize xs)
                   where f x = encipher n x

-- 8.
reverseKey :: [(Char, Char)] -> [(Char, Char)]
reverseKey xs = map (\(v, k) -> (k, v)) xs

-- 9.
decipher :: Int -> Char -> Char
decipher n c = if isDigit c then c
               else if (ord c) - n < 65 then chr(91 - (65 - ((ord c) - n))) else chr((ord c) - n)

decipherStr :: Int -> String -> String
decipherStr n xs = map f xs
                   where f x = decipher n x

-- 10.
prop_cipher :: Int -> String -> Bool
prop_cipher = undefined

-- 11.
contains :: String -> String -> Bool
contains [] xs = False
contains xxs xs = if isPrefixOf xs xxs then True
                  else contains (tail xxs) xs

-- 12.
candidates :: String -> [(Int, String)]
candidates xs = filter f [(n, xd) | n <- [1..26], let xd = decipherStr n xs]
                where f (_, x) = contains x "THE" || contains x "AND"



-- Optional Material

-- 13.
splitEachFive :: String -> [String]
splitEachFive = undefined

-- 14.
prop_transpose :: String -> Bool
prop_transpose = undefined

-- 15.
encrypt :: Int -> String -> String
encrypt = undefined

-- 16.
decrypt :: Int -> String -> String
decrypt = undefined

-- Challenge (Optional)

-- 17.
countFreqs :: String -> [(Char, Int)]
countFreqs = undefined

-- 18
freqDecipher :: String -> [String]
freqDecipher = undefined

