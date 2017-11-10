{-
Programare Declarativa
Test laborator
Grupa 341

11 nov, sapt 6
14:00 - 15:00
-}

import Data.Char
import Data.List



{-
1. Cenzurare nume proprii (care incep cu litera mare)
Folosind recursivitate si functii din categoria A

> cenzNume "Dan stie locul"
"D** stie locul"
-}
cenzNume :: String -> String
cenzNume = undefined


{-
2. Cenzurare numere - inlocuire fiecare cifra dintr-un string cu X
Folosind list comprehension si functii din categoria A

ex:
> cenzNr "suna la 0722"
"suna la XXXX"
-}
cenzNr :: String -> String
cenzNr = undefined





{-
> parseInt "123"
123

> parseInt "a12"
0
-}
parseInt :: String -> Int
parseInt inp
  | all isDigit inp  = helper (reverse inp) 0
  | otherwise        = 0
    where helper "" _ = 0
          helper (c:cs) pow = (digitToInt c * 10^pow) + helper cs (pow+1)

{-
3. Valoarea totala a valutei dintr-un string
Bonus: doar valuta straina (ignora lei)
Rata de conversie este data de functia rata
Folosind higher order functions si functii din categ A, B, C

Hint1: puteti folosi functia words. ex: words "ab cd ef" = ["ab", "cd", "ef"]
Hint2: puteti folosi functia parseInt

> valLei "10l si 100E plus 1$"
403  -- 10 lei ignorat + 100*4 eur + 1*3 dolari
-}
rata :: Char -> Int
rata '$' = 3  -- dolari
rata 'E' = 4  -- euro
rata 'L' = 5  -- lire

valLei :: String -> Int
valLei = undefined






exConv :: [(String, String)]
exConv = [ -- exemplu de conversatie
  ("inspector John", "Aminteste-mi pretul"),
  ("Victor",         "500$ pe langa cei 200E"),
  ("inspector John", "Batem palma")
  ]
{-
4. Pentru o conversatie data ca o lista de (Persoana, Mesaj):
 - cenzureaza valorile monetare din mesaje (folosind functia cenzNr)
 - cenzureaza numele infractorilor (folosind functia cenzNume)
   numele politistilor se deosebesc de cele ale infractorilor prin faptul
   ca incep cu una din functiile din lista funcPolitie

 Intoarce:
  - concatenarea tuturor replicilor in forma Pers1: Mesaj1;   Pers2: Mesaj2;   ...
 Bonus: intoarce o unde pe a doua pozitie se afla:
  - suma valorilor discutate, in lei (folosind functia valLei)

Puteti folosi orice metoda si functii din categ A, B, C
Hint1: puteti folosi isPrefixOf: "ab" `isPrefixOf` "abcd" = True
Hint2: puteti folosi any: any (==5) [1, 2+3, 5] = True

> cenz exConv  -- exemplu de conversatie definit mai sus
("inspector John: Aminteste-mi pretul;
 V*****: XXX$ pe langa cei XXXE;
 inspector John: Batem palma;",
 2300)  -- 500$ + 200E in lei
-}

funcPolitie :: [String]
funcPolitie = ["inspector", "general", "ofiter"]

cenz :: [(String, String)] -> (String, Int)
cenz = undefined



{- Categoria A. Functii de baza
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
ord :: Char -> Int
chr :: Int -> Char
Intervale
[first..], [first,second..], [first..last], [first,second..last]
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
takeWhile isLower "goodBye" = "good"

take :: Int -> [a] -> [a]
take 4 "goodbye" = "good"

dropWhile :: (a->Bool) -> [a] -> [a]
dropWhile isLower "goodBye" = "Bye"

drop :: Int -> [a] -> [a]
drop 4 "goodbye" = "bye"

elem :: (Eq a) => a -> [a] -> Bool
elem 'd' "goodbye" = True

replicate :: Int -> a -> [a]
replicate 5 '*' = "*****"

zip :: [a] -> [b] -> [(a,b)]
zip [1,2,3,4] [1,4,9] = [(1,1),(2,4),(3,9)
-}

{- Categoria C. Map, Filter, Fold
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
