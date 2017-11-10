-- Functiile care pot fi folosite sunt descrise la sfarsitul fisierului
-- categoria A - functii de baza
-- categoria B - functii din biblioteci (fara map, filter, fold)
-- categoria C - map, filter, fold 
 

{- 
Se considera urmatorul sistem de criptare in care literele alfabetului (din care se elimina una de frecventa mica - pentru usurinta Z) sunt scrise intr-un tabel de 5*5 astfel:
 
 
 
	A B C D E

A 	A B C D E
B 	F G H I J
C 	K L M N O 
D 	P Q R S T 
E 	U V W X Y

Fiecare litera din textul clar se cripteaza astfel: se cauta litera in tabel si se inlocuieste cu numarul liniei si coloanei pe care se gaseste astfel:

A -> AA
H -> BC
U -> EA

etc.


In exercitiile de mai jos veti scrie functii de criptare si decriptare pentru sistemul de mai sus.

-}

-- 1. 1p) Scrieti o functie care permuta circular un interval de forma ['A'..'Z'] cu n pozitii la dreapta 

rotate :: Int -> String -> String
rotate = undefined

-- rotate 1 ['A'..'D'] = "DABC"
-- rotate 2 ['A'..'D'] = "CDAB"

-- 2. a) (2p) Scrieti o functie recursiva care genereaza toate perechile posibile de elemente din intervalele de forma ['A'..'E'] * ['A'..'E'] adica ('A','A'), ('A','B'), ('A','C'), ('A','D'), ('A','E'), ('B','A'), ('B','B'), ....) (produsul cartezian al celor doua intervale) folosind si functia de la punctul 1. Parametrul Int al functiei reprezinta lungimea intervalelor pe care se face produsul cartezian (chiar daca ne intereseaza numai intervalul fixat ['A'..'E'])


pairs :: Int -> [(Char,Char)]
pairs = undefined

-- 2. b) (1p) Aplicati pe lista de perechi obtinuta o transformare care concateneaza o pereche intr-un string cu 2 caractere asa incat sa obtineti lista ("AA","AB",...) in aceasta ordine

-- Folositi doar functii din categoriile A, B si C

transform :: [(Char,Char)] -> [String]
transform = undefined

-- 2.  (0.5p) c) Scrieti apoi o functie care asociaza literelor din alfabet de la A la Y perechi din cele generate de mai sus:

cipher :: Int -> [(Char,String)]
-- cipher 5 = [('A',"AA"),('B',"AB"),('C',"AC")...]
cipher = undefined

-- 3. (2p) Scrieti o functie care sa efectueze criptarea unui sir de caractere cu sistemul descris mai sus.
-- encrypt "PROGRAMARE" = "DADCCEBBDCAACCAADCAE"			  
-- Folositi doar functii din categoriile A, B si C
 
encrypt :: String -> String
encrypt = undefined

-- 4. In vederea decriptarii, textul criptat trebuie spart in grupuri de cate 2 litere.
--"DADCCEBBDCAACC" = ("DA","DC","CE","BB",...)
--In acest scop, vrem sa folosim descriere de liste iar nu recursivitate. 

-- a) (1p) Scrieti doua functii care, pentru un sir dat, extrag lista cu literele de pe pozitii pare, respectiv impare.  

-- Folositi numai descriere de liste si functii din categoriile A si B
even_poz :: String -> String
even_poz = undefined

odd_poz :: String -> String
odd_poz = undefined

-- b) (1p) Folosind functiile de mai sus, scrieti o functie care sparge un sir criptat in grupuri de cate 2 litere. Folositi 

breaking :: String -> [String]
breaking = undefined

-- breaking "DADCCEBBDCAACC" = ("DA","DC","CE","BB",...)


 --c) (2p) Scrieti o functie care decripteaza un text criptat.

decrypt :: String -> String
decrypt = undefined

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
