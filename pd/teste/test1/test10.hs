import Data.Char
import Test.QuickCheck

-- Redenumiti fisierul de test in GrupaNume.hs 
-- exemplu: 342Popescu.hs

-- la final, pentru a trimite testul 
-- incarcati fisierul pe linkul acesta: https://sendtomycloud.com/test342a

-- primele 10 numere prime, mai putin 29 peste care s-a sarit
-- indexarea in tablou este de la 0 la 9
prime = ["2","3","5","7","11","13","17","19","23","31"]

-- 1.  (1p) Scrieti o functie care primind un caracter c
--     Returneaza elementul de pe pozitia c din lista prime, daca caracterul c este cifra
--     si eroare in cazul in care c este un oarecare alt caracter
--     Puteti folosi orice.
--     Exemple:
--     charToElem '3' == "7"

charToElem :: Char -> String
charToElem = undefined

-- 2.  (2p) Folosind recursivitate si functiile din clasa A
-- 	scrieti o functie care converteste un String la Int
-- 	puteti sa va definiti functii ajutatoare care respecta aceleasi conditii (recursivitate si functii din clasa A)
-- 	exemplu:
-- 	strToInt "452" == 452

strToInt :: String -> Int
strToInt = undefined

-- 3.a)  (2p) Folositi doar list comprehension, si functiile definite anterior + functiile din categoria A, B
-- 	convertiti un numar la codificarea sa cu numere prime care se obtine prin inlocuirea fiecarui caracter/cifra c
--  din stringul dat cu elementul de pe pozitia c din tabloul prime (si concatenarea tuturor codificarilor
--  in ordinea cifrelor din numar, adica de la stanga la dreapta)
-- 	exemple:
-- 	enc "6" == "17"
-- 	enc "802" == "2325"     "23" + "2" + "5"
-- 	enc "1239" == "35731"   "3" + "5" + "7" + "31"
-- 	enc "9876543210" == "3123191713117532"  

enc :: String -> String
enc = undefined

-- 3.b) (2p) Primiti un sir de stringuri (semnal) formate doar din caractere care sunt cifre, printre care unele 
-- sunt rebundante (zgomot, erori de transmisie) care sunt notate prin siruri vide. Se vrea eliminarea erorilor 
-- din cadrul mesajului transmis, si formarea unei codificari de numere prime, reprezentata printr-un singur
-- sir (string) format din alipirea codificarilor individuale ale fiecarui string din mesaj, in ordinea in care 
-- acestea apar in tablou (evident, fara cele care sunt zgomot)
-- (Folositi functiile din categoria A,B,C si functia enc de mai sus, dar fara recursie sau list comprehension)
-- (16 simboluri) 
-- ("" se considera un singur simbol, la fel si operatorii, numele de functie sau variabila, parantezele se numara separat)
-- exemplu:
-- encmsg ["1","2","3","","91","","24","","13"] == "35731351137"
encmsg :: [String] -> String
encmsg = undefined

-- 4.a) (1p)  Scrieti o functie care primeste un String ca parametru
--            Si returneaza pozitia lui in tabelul prime (indicele), daca acest string face parte din lista prime
--            In caz contrar, returnati -1
-- exemple:
-- elm "13" == 5
-- elm "2" == 0

elm :: String -> Int
elm e = undefined

-- 4.b) (2p) Cifrul nostru nu este sigur. De exemplu codificarea "2313" poate proveni de la 
--           "2" + "3" + "13" sau "2" + "31" + "3" sau "23" + "13"
--          Scrieti o functie care pentru un mesaj codificat returneaza o lista cu toate
--          variantele posibile de decodificare, iar in caz de cifru incorect (care nu poate fi decodificat)
--          returnati sir vid ([]).
--          Puteti folosi orice si oricate functii ajutatoare
       
dec :: String -> [String]
dec s = undefined

-- teste 
-- dec "3113" == ["95", "141"]
-- dec "231" == ["09"]
-- dec "3113237" ==  ["9583","95013","14183","141013"]
-- dec "72313" == ["385", "3091", "3015"]

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
