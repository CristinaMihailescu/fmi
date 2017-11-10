{-
---------!IMPORTANT!-----------
Aveti 4 exercitii.  Dintre acestea (la alegere):
* Unul trebuie rezolvat folosind *doar* recursie si functii de baza (categoria A)
  (fara descrieri de liste si fara functii din categoriile B si C)
* Unul trebuie rezolvat folosind *doar* descrierieri de liste si functii din categoriile A si B
  (fara recursie si fara functii din categoria C)
* Unul trebuie rezolvat folosind *doar* functii din categoriile A, B, si C
  (fara recursie si fara descrieri de liste)
* Unul este la alegere (puteti folosi orice, chiar si in afara categoriilor date).

Functiile din categorile A, B, si C sunt descrise la sfarsitul fisierului
categoria A - functii de baza, 
categoria B - functii din biblioteci (fara map, filter, fold)
categoria C - map, filter, fold 
-}

import Data.Char
{-
1. (2 puncte) Scrieti o functie care data fiind o lista de perechi de numere intregi
determina daca toate perechile de numere pare
au produsul elementelor mai mare decat 10

> prodMare [(2, 8), (1, 5), (10, 10)]
True  -- 16, (1 si 5 sunt impare), 100

> prodMare [(0, 4), (100, 5)]
False  -- 0, (5 este impar)
-}
prodMare :: [(Int, Int)] -> Bool
prodMare = undefined


{-
2. (2 puncte) Scrieti o functie care date fiind doua litere din alfabet, calculeaza
cate vocale ('a', 'e', 'i', 'o', 'u') exista intre cele doua litere

> vocaleIntre 'a' 'f'
2  -- a si e
-}
vocaleIntre :: Char -> Char -> Int
vocaleIntre = undefined

{-
3. (2 puncte) Scrieti o functie care data fiind o lista de numere ii calculeaza
dispersia.  Dispersia se poate obtine in felul urmator:
Daca a = [a1, a2, ..., an], atunci dispersia lui a
D(a) = (a1-m)^2 + (a2-m)^2 + ... + (an-m)^2,
unde m este media elementelor din a

> dispersie [0, 2, 4, 6]
20.0  -- (media = 3) ~> [0-3, 2-3, 4-3, 6-3] ~> [-3^2, -1^2, 1^2, 3^2] ~> 20
-}
dispersie :: [Float] -> Float
dispersie = undefined

{-  Functie ajutatoare
> parseInt "123"
123
-}
parseInt :: String -> Int
parseInt inp = foldl ((+) . (10*)) 0 $ map digitToInt inp

{-
4. (3 puncte) Scrieti o functie care dat fiind un sir de caractere
calculeaza suma valorilor obtinute prin inmultirea cifrelor 
din fiecare numar mai mare decat 10 care apare (individual)in sir
Hint1: puteti folosi functia words. ex: words "ab cd ef" = ["ab", "cd", "ef"]
Hint2: puteti folosi functia parseInt

> f "Am 3 mere, 25 pere, 31 banane si 100 prune"
13  -- (3 ignorat) + 2*5 + 3*1 + 1*0*0 ~> 10 + 3 + 0 ~> 13

-}
f :: String -> Int
f = undefined

{- Catcgoria A. Functii de baza
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

{- Categoria B. Funetii din biblioteci
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

curry :: ((a, b) -> c) -> a -> b -> c
curry snd 1 2 = 2
uncurry :: a -> b -> c -> (a, b) -> c
uncurry (*) (3,7) = 21
-}