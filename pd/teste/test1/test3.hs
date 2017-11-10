-- Functiile care pot fi folosite sunt descrise la sfarsitul fisierului
-- categoria A - functii de baza
-- categoria B - functii din biblioteci (fara map, filter, fold)
-- categoria C - map, filter, fold 
import Data.Char
import Test.QuickCheck
 
type Cifra = Int
type Numar = [Cifra]

-- In acest test vom implementa cateva operatii pe numere mari.
-- O Cifra este un numar intreg intre 0 si 9.
-- Un Numar este o lista de Cifre. E.g., [2,1,4]
-- Numarul intreg reprezentat de un Numar n este obtinut
-- prin alipirea cifrelor lui n de la stanga la dreapta,
-- ignorand cifrele de 0 de la inceputul numarului.
-- E.g., numarul corespunzator lui [0, 0, 0, 2, 1, 4] este 214.
-- Prin conventie lista vida de cifre [] poate reprezenta nr. 0


-- 1a (0,5p). Scrieti o functie care date fiind un Numar n si o lungime l,
-- adauga l cifre de 0 la stanga lui n.
-- E.g., lungimePlus [2, 1, 4] 3 = [0, 0, 0, 2, 1, 4]
lungimePlus :: Numar -> Int -> Numar
lungimePlus = undefined

-- 1b (1p). Scrieti o functie care ia ca argument o pereche de numere
-- si calculeaza perechea de numere cu numar egal de cifre 
-- obtinuta prin adaugarea de zerouri la stanga numerelor date ca argument.
-- E.g., normalizeazaLungime ([1,2], [3,4,5,6]) = ([0,0,1,2], [3,4,5,6])
-- E.g., normalizeazaLungime ([1,2], []) = ([1,2], [0,0])
normalizeazaLungime :: (Numar, Numar) -> (Numar, Numar)
normalizeazaLungime = undefined

-- 2a (0,75p). Scrieti o functie care ia doua Numere *de aceeasi lungime* ca argumente
-- si verifica daca primul Numar este mai mic sau egal cu al doilea.
-- Puteti folosi doar recursie si functii din categoria A
-- E.g., [1,2,3] `lteN` [1,2,1] = False
-- E.g., [0,2,3] `lteN` [1,2,1] = True
lteN :: Numar -> Numar -> Bool
lteN = undefined

-- 2b (0,25p).  Scrieti o functie care ia doua Numere ca argumente
-- si verifica daca primul Numar este mai mic sau egal cu al doilea
lte :: Numar -> Numar -> Bool
lte = undefined

-- 3a (1p). Scrieti o functie care primeste ca argument o lista de
-- numere naturale intre 0 si 81, reprezentand rezultatele brute
-- ale unei operatii asupra unui numar, si calculeaza o pereche
-- formata dintr-o Cifra c si o lista de cifre cs, unde cs are aceeasi 
-- lungime ca lista initiala, fiind obtinuta prin propagarea 
-- depasirilor de cifre de la dreapta la stanga, iar c este cifra 
-- care reprezinta depasirea in plus.
-- E.g. propagaFold' [1, 1] = (0, [1, 1])    -- obtinut din 10 + 1
-- E.g. propagaFold' [1, 10] = (0, [2, 0])   -- obtinut din 19 + 1
-- E.g. propagaFold' [10, 1] = (1, [0, 1])   -- obtinut din 30 + 71
-- E.g. propagaFold' [81, 81] = (8, [9, 1])  -- obtinut din 9*99
-- Folositi doar functii din categoriile A, B, si C
-- Fara recursie sau descrieri de liste.
propagaFold' :: [Int] -> (Cifra, [Cifra])
propagaFold' = undefined

-- 3b (0,5p).  Scrieti o functie care primeste ca argument o lista
-- de numere naturale ca la (3a) si calculeaza numarul corespunzator ei
-- obtinut prin propagarea depasirilor.
-- E.g. propagaFold [1, 1] =  [0, 1, 1]   -- obtinut din 10 + 1
-- E.g. propagaFold [1, 10] = [0, 2, 0]   -- obtinut din 19 + 1
-- E.g. propagaFold [10, 1] = [1, 1, 1]   -- obtinut din 30 + 71
-- E.g. propagaFold [81, 81] = [8, 9, 1]  -- obtinut din 9*99
propagaFold :: [Int] -> Numar
propagaFold = undefined

-- 4a (0,75p). Scrieti o functie care primeste ca argument doua liste de cifre
-- *de lungime egala* cs1 si cs2, si calculeaza lista de intregi cs
-- cu proprietatea ca pentru toti i, cs !! i == cs1 !! i + cs2 !! i
-- 
-- E.g., [7,2,3] `plusLista` [4,5,7] = [11,7,10]
-- Folositi doar recursie si functii din categoria A
plusLista :: [Cifra] -> [Cifra] -> [Int]
plusLista = undefined

-- 4b (0,25p). Scrieti o functie care primeste ca argument doua Numere
-- si calculeaza suma lor
-- E.g., [7,2,3] `plus` [4,5,7] = [1,1,8,0]
-- E.g., [7,3] `plus` [4,5,7] = [5,3,0]
plus :: Numar -> Numar -> Numar
plus = undefined

-- 5a (0,75p). Scrieti o functie care primeste ca argument doua liste de cifre
-- *de lungime egala* cs1 si cs2, si calculeaza lista de intregi cs
-- cu proprietatea ca pentru toti i, cs !! i == cs1 !! i + cs2 !! i
-- E.g., [7,2,3] `minusLista` [4,5,7] = [3,-3,-4]
-- Folositi doar descrieri de liste si functii din categoriile A si B
-- Fara recursie
minusLista :: [Cifra] -> [Cifra] -> [Int]
minusLista = undefined

-- 5b (0,25p). Scrieti o functie care primeste ca argument doua Numere
-- si calculeaza diferenta lor, daca primul este mai mare sau egal decat al doilea.
-- In caz contrar, esueaza cu mesajul "Numere negative neimplementate"
-- E.g., [7,2,3] `minus` [4,5,7] = [2,6,6]
-- E.g., [7,3] `minus` [4,5,7]       *** Exception: Numere negative neimplementate
minus :: Numar -> Numar -> Numar
minus = undefined

-- 6a (0,75p). Scrieti o functie care primeste ca argument o Cifra c si un Numar n
-- si calculeaza Numarul obtinut prin inmultirea lui n cu c.
-- E.g., 4 `mulC` [1,0,4] = [4,1,6]
-- E.g., 9 `mulC` [9,9] = [8,9,1]
-- Folositi doar functii din categoriile A, B, si C, si functiile definite mai sus.
-- Fara recursie sau descrieri de liste.
mulC :: Cifra -> Numar -> Numar
mulC = undefined

-- 6b (0,25). Scrieti o functie care primeste ca argument un Numar n 
-- si calculeaza Numarul obtinut prin inmultirea lui n cu 10.
-- E.g., mul10 [3,4,5] = [3,4,5,0]
-- E.g., mul10 [3,5] = [3,5,0]
mul10 :: Numar -> Numar
mul10 = undefined

-- 7 (2p). Scrieti o functie care primeste ca argument doua Numere
-- si calculeaza Numarul obtinut prin imultirea celor doua numere.
-- E.g., [1,2] `mul` [5,3] = [6,3,6]
-- E.g., [9,9,9] `mul` [9,9,9] = [9,9,8,0,0,1]
-- (32 de simboluri)
mul :: Numar -> Numar -> Numar
mul = undefined


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
