
import Data.Char
import Data.List

-- In acest test vom implementa un sistem simplu de sugestii pentru autocomplete / search de cuvinte
dict = ["cat", "catering", "caterpillar", "carbon", "sea", "seashore", "seagull", "season", "severe"]

-- 1.1 (1p) (Puteti folosi functii din categoria A si B)
-- Scrieti o functie care primeste un intreg - pozitia cuvantului din dictionar
-- si returneaza lungimea acestuia, sau eroare daca pozitia depaseste limitele tabloului
-- exemplu: ll 0 == 3
ll :: Int -> Int
ll poz = if poz >= 0 && poz < length dict 
         then length (dict !! poz)
         else error "index out of bound"


-- 1.2 (1p) (Puteti folosi functii din categoria A si B)
-- Scrieti o functie care primeste ca argumente doua perechi de intregi de forma
-- (Int, Int) cu semnificatia (Rating, pozitia in dictionar)
-- Si returneaza True, daca prima pereche este mai mare sau egala decat a doua, si False in caz contrar
-- O pereche se considera mai mare decat cealalta daca Ratingul primei este mai mare, 
-- sau in caz de egalitate a ratingurilor, lungimea primului cuvant (cel dat de indicele din pereche) 
-- este mai mica decat lungimea cuvantului dat de indicele din a doua pereche.
-- Exemplu:
-- comp (4, 5) (3, 1) == True   -- ratingul primului e mai mare
-- comp (4, 0) (4, 1) == True   -- rating egal dar lungimea lui dict[0] <= lungimea lui dict[1]
-- comp (3, 0) (5, 2) == False   -- rating primului mai mic
comp :: (Int, Int) -> (Int, Int) -> Bool
comp (a1,b1) (a2,b2) | a1 > a2  || (a1 == a2 && ll b1 <= ll b2) = True
                     | otherwise = False

-- 2.1  (2p) (Folosing recursivitate si (daca aveti nevoie) functiile ajutatoare si cele din categoria A si B)
--      Scrieti o functie care calculeaza gradul de similaritate a doua cuvinte (rating)
--      dupa regulile urmatoare: 
--      1. Se suprapune litera cu litera un cuvant peste celalalt
--      2. Se parcurge de la stanga la dreapta si se aduna lungimea secventei continue de litere egale(doua cate doua din s si q)
--         care se termina in caracterul curent. Daca la un moment dat caracterele nu coincid, se reseteaza
--         lungimea secventei (se incepe de la 0 din nou)
--      3. Ratingul va fi suma lungimilor fiecarei dintre aceste secvente
-- exemplu:
--   rating "sebshote" "seashore" == 14
--  l = lungimea curenta a secventei de litere egale (doua cate doua, din s si q)
-- sum = suma formata prin adunarea lungimilor fiecarei dintre secvente
--   s   |  s e b s h o t e
--   q   |  s e a s h o r e
--   l   |  1 2 0 1 2 3 0 1
--  sum  |  1 3 3 4 6 9 9 10  = 10 (rezultatul final, suma lungimilor, a randului de mai sus notat cu l)

--  rating "acat" "bcat" == 6
--  rating "coconut" "coroutine" == 4
ratingF :: String -> String -> Int -> Int
ratingF _ [] f = 0
ratingF [] _ f = 0
ratingF (s:ss) (q:qs) f | s == q = ratingF ss qs (f+1) + f + 1
                        | otherwise = ratingF ss qs 0
                          
rating :: String -> String -> Int
rating s q = ratingF s q 0

-- 2.2   (2p) (Folosind list comprehension si functiile din categoriile A si B) 
--        Scrieti o functie care returneaza ratingurile tuturor posibilitatilor de a suprapune primul cuvant peste celalalt 
--        prin shiftarea la dreapta a primului cuvant peste al doilea
-- exemplu: 
-- allOverlapsRatings "acat" "acab" == [6,0,1,0]
--             |acat    | acat     |  acat    |   acat
--             |acab    |acab      |acab      |acab
-- ratingurile   6        0            1          0
-- dupa cum se vede in imagine este echivalent cu a verifica similaritatea dintre
--  "acat" si "acab", 
--  "acat" cu "cab", 
--  "acat" cu "ab", 
--  "acat" ci "b"

-- allOverlapsRatings "cactus" "picartous" == [1,0,4,3,0,0,0,0,0]
-- allOverlapsRatings "coconut" "coroutine" == [4,0,1,1,0,0,0,0,0]
allOverlapsRatings :: String -> String -> [Int]
allOverlapsRatings s q = [rating s (drop i q) | i <- [0..(length q)-1]]

-- 3  (1p) (Folosind functiile din categoriile A,B,C si cele definite mai sus, 
--      dar fara recursie/list comprehension) 
--        Scrieti o functie care returneaza pentru un cuvant s, 
--        lista cu ratingurile maxime de similaritate (prin suprapunere + shiftare la dreapta)
--        intre s si fiecare dintre cuvintele din dictionar 
-- exemplu:
--   suggestionsRating "tea" == [1,3,3,0,3,3,3,3,1]
--   cu semnificatia ca maximul din allOverlapsRatings "tea" "cat" este 1 ("cat" fiind primul cuvant din dictionar)
--   continuand,   maximul din allOverlapsRatings "tea" "catering" este 3 ("catering" fiind al doilea cuvant din dictionar)
--   etc.
-- teste aditionale:
-- suggestionsRating "shark" == [0,1,3,0,2,4,2,2,1]
-- suggestionsRating "dolphin" == [0,3,1,1,0,1,1,1,0]
-- (1p) (18 caractere)
suggestionsRating :: String -> [Int]
suggestionsRating s = map (foldr (max) 0) $ map (allOverlapsRatings s) dict

-- 4.1 (1p) (Fara restrictii, puteti folosi orice)
--      Scrieti o functie care insereaza o pereche de forma (Int, Int)
--      Intr-un tablou de astfel de perechi, sortate crescator dupa functia 
--      de comparatie comp (definita de voi mai sus) 
--      (complexitatea O(N) e suficient (ca nu cumva sa va apucati sa faceti cautare binara :) ))
-- helper variable / constant function
yy :: [(Int, Int)]
yy = [(2,0), (2,3), (2,1), (4,2), (5,4)]
-- exemplu: insertPg (4,7) yy == [(2,0), (2,3), (2,1), (4,2), (4,7), (5,4)]
--          insertPg (3,7) yy == [(2,0), (2,3), (2,1), (3,7), (4,2), (5,4)]

insertp :: (Int,Int) -> [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)]
insertp v [] b = b ++ [v] 
insertp v (x:xs) b | comp x v = b ++ ([v,x] ++ xs)
                   | otherwise = insertp v (xs) (b ++ [x])

insertPg :: (Int,Int) -> [(Int,Int)] -> [(Int,Int)]
insertPg v xs = insertp v xs []

-- 4.2 (1p) (Folosind functia insertPg si recursivitate)
--    Scrieti o functie care sorteaza un sir de perechi crescator dupa 
--    functia de comparatie comp (definita de voi mai sus)
sortRatingsP :: [(Int,Int)] -> [(Int,Int)]
sortRatingsP [] = []
sortRatingsP (x:xs) = insertPg x $ sortRatingsP xs

-- test:
-- sortRatingsP $ reverse yy == [(2,1),(2,3),(2,0),(4,2),(5,4)]

 -- helper function
ff :: String -> [(Int,Int)]
ff s = (suggestionsRating s) `zip` [0..]
-- ff "seash" == [(0,0),(2,1),(2,2),(0,3),(8,4),(32,5),(8,6),(16,7),(4,8)]

-- 4.3 (1p Bonus)
--     (Folosind functiile din categoria A,B,C, si functiile definite anterior de voi
--       dar fara recursie / list comprehension)
--       Scrieti o functie care va returna o lista cu cuvintele din dictionar
--       in ordinea descrescatoare a ratingului lor fata de cuvantul s(dat ca argument de intrare)
--       dar fara cuvintele cu care au similaritate zero.
getBestSugestions :: String -> [String]
getBestSugestions s = map (\(x,y) -> dict !! y) (reverse . sortRatingsP . (filter (\p -> fst p > 0)) $ ff s)

-- teste:
-- getBestSugestions "cactus" == ["cat", "carbon", "catering", "caterpillar", "sea", "season", "seagull", "seashore"]
-- getBestSugestions "seal" == ["sea", "season", "seagull", "seashore", "severe", "catering", "caterpillar"]
-- getBestSugestions "seven" == ["severe", "sea", "season", "seagull", "seashore", "catering", "carbon", "caterpillar"]

-- zip (map (^2) a) (map (^2) b)
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
