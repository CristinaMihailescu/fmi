import Data.Char
import Test.QuickCheck

-- primele 10 numere prime, mai putin 23,31,33,37 peste care s-a sarit din cauza coliziunilor
-- indexarea in tablou este de la 0 la 9
prime = [2,3,5,7,11,13,17,19,29,39]


-- 1.  (1p) Scrieti o functie care primind numar, returneaza True daca el se gaseste in
--     lista de numere prime de mai sus
--     Puteti folosi orice.
--     Exemple:
--     Prim 3 == True
--     Prim 4 == False
prim :: Int -> Bool
prim x = elem x prime

-- 2.  (2p) Folosind recursivitate si functiile din clasa A
-- 	scrieti o functie care converteste un Int la string
-- 	puteti sa va definiti functii ajutatoare care respecta aceleasi conditii (recursivitate si functii din clasa A)
-- 	exemplu:
-- 	numToString 452 == "452"
numToString2 :: Int -> Int -> String
numToString2 0 r = [chr(r + 48)]
numToString2 q r = (numToString2 (div q 10) (mod q 10)) ++ [chr (r + 48)]

numToString :: Int -> String
numToString x = numToString2 (div x 10) (mod x 10)


-- 3.a)  (2p) Folositi doar list comprehension, si functiile definite anterior + functiile din categoria A, B
-- 	convertiti un numar la codificarea sa cu numere prime care se obtine prin inlocuirea fiecarei cifre c
--  din numarul dat cu elementul de pe pozitia c din tabloul prime (si concatenarea tuturor codificarilor
--  in ordinea cifrelor din numar, adica de la stanga la dreapta)
-- 	exemple:
-- 	enc 6 == "17"
-- 	enc 802 == "2325"     "23" + "2" + "5"
-- 	enc 1239 == "35729"   "3" + "5" + "7" + "29"
-- 	enc 9876543210 == "2923191713117532"  
enc :: Int -> String
enc n = concat [numToString (prime !! (ord x - 48)) | x <- numToString n]

-- 3.b) (2p) Primiti un sir de numere (semnal), printre care unele sunt rebundante (zgomot, erori
-- de transmisie) care sunt notate prin numere negative. Se vrea eliminarea erorilor din cadrul
-- mesajului transmis, si formarea unei codificari de numere prime, reprezentata printr-un singur
-- sir (string) format din alipirea codificarilor individuale ale fiecarui numar din mesaj, in
-- ordinea in care acestea apar in tablou (evident, fara cele care sunt zgomot)
-- (Folositi doar functiile din categoria C si functia enc de mai sus)
-- (16 simboluri)
-- exemplu:
-- encmsg [1,2,3,-3,91,-1,24,-2,13] == "35731351137"
encmsg :: [Int] -> String
encmsg = foldr (++) "" . map enc . filter (>=0)

-- 4.a) (1p)  Scrieti o functie care primeste un intreg ca parametru
--            Si returneaza pozitia lui in tabelul prime (indicele), daca acest numar face parte din lista prime
--            In caz contrar, returnati -1

v = prime `zip` [0..]

elm :: Int -> Int
elm e = if length t > 0 then head t else -1
        where t = [s|(f,s) <- v, f == e]

-- 4.b) (2p)  Scrieti o functie care decodifica un mesaj codificat, si returneaza numarul initial
--          din care s-a obtinut mesajul codificat. In caz de codificare gresita, returnati
--          eroare cu mesajul "cirfu incorect"
--          Puteti folosi orice si oricate functii ajutatoare

dec2 :: String -> Int -> Int
dec2 [] v = v
dec2 (x:[]) v = v*10 + elm (digitToInt x)
dec2 (x:y:xs) v | prim w == True = dec2 xs (v*10 + elm w)
                | prim s == True = dec2 (y:xs) (v*10 + elm s)
                | otherwise = error "cifru incorect"
                where s = (digitToInt x)
                      t = (digitToInt y)
                      w = (s*10) + t

dec :: String -> Int
dec s = dec2 s 0

-- Pentru a va testa functia de decriptare
-- cu QuickCheck
prop_dec :: Int -> Bool
prop_dec x = abs x == dec (enc (abs x))
-- trebuie sa va dea:
-- *Main> quickCheckprop_dec
-- +++ OK, passed 100 tests.


{- Categoria A. Funetii de baza
div, mod :: Integral a => a -> a -> a
even, odd :: Integral a => a -> Bool
(+), (*), (-), (/) :: Num a => a -> a -> a
(<), (<=), (>), (>=) :: Ord => a -> a -> Bool
(==), (/=) :: Eq a => a -> a -> Bool
(&&), (||) :: Bool -> Bool -> Bool
not :: Bool -> Bool
max, min :: Ord a => a -> a -> a
isAlpha, isAlphaNum, isLower, isUpper, isDigit :: Char -> Bool
toLower, toUpper :: Char -> Char
digitToInt :: Char -> Int
ord :: Char -> Int
chr :: Int -> Char
-}


{- Categoria B. Functii din biblioteci
sum, product :: (Num a) => [a] -> a
sum [1.0,2.0,3.0] = 6.0
product [1,2,3,4] = 24


and, or :: [Bool] -> Bool
and [True,False,True] = False
or [True,False,True] = True


maximum, minimum :: (Ord a) => [a] -> a
maximum [3,1,4,2]  =  4
minimum [3,1,4,2]  =  1


reverse :: [a] -> [a]
reverse "goodbye" = "eybdoog"


concat :: [[a]] -> [a]
concat ["go","od","bye"]  =  "goodbye"


(++) :: [a] -> [a] -> [a]
"good" ++ "bye" = "goodbye"


(!!) :: [a] -> Int -> a
[9,7,5] !! 1  =  7


length :: [a] -> Int
length [9,7,5]  =  3


head :: [a] -> a
head "goodbye" = 'g'


tail :: [a] -> [a]
tail "goodbye" = "oodbye"


init :: [a] -> [a]
init "goodbye" = "goodby"


last :: [a] -> a
last "goodbye" = 'e'


takeWhile :: (a->Bool) -> [a] -> [a]
takeWhile isLower "goodDay" = "good"


take :: Int -> [a] -> [a]
take 4 "goodbye" = "good"


dropWhile :: (a->Bool) -> [a] -> [a]
dropWhile isLower "goodBye" = "Bye"


drop :: Int -> [a] -> [a]
drop 4 "goodbye" = "bye"


elem :: (Eq a) => a -> [a] -> Bool
elem 'd' "gdbye" = True


replicate :: Int -> a -> [a]
replicate 5 '*' = "*****"


zip :: [a] -> [b] -> [(a,b)]
zip [1,2,3,4] [1,4,9] = [(1,1),(2,4),(3,9)


-}


{- Catgoria C. Map, Filter, Fold
map :: (a -> b) -> [a] -> [b]
map (+3) [1,2] = [4,5]


filter :: (a -> Bool) -> [a] -> [a]
filter even [1,2,3,4] = [2,4]


foldr :: (a -> b -> b) -> b -> [a] -> b
foldr max 0 [1,2,3,4] = 4


(.) :: (b -> c) -> (a -> b) -> a -> c
($) :: (a -> b) -> a -> b
(*2) . (+3) $ 7 = 20


flip :: (a -> b -> c) -> b -> a -> c
flip (-) 2 3 = 1
-}
