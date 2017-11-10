-- Functiile care pot fi folosite sunt descrise la sfarsitul fisierului
-- categoria A - functii de baza
-- categoria B - functii din biblioteci (fara map, filter, fold)
-- categoria C - map, filter, fold 
 

import Data.Char
import Data.List
import Test.QuickCheck

{-
Partea 1.  Straddle Checkerboard Cipher
---------------------------------------

The straddling checkerboard is a substitution cipher.

The code
~~~~~~~~

The "key" for a straddling checkerboard is a permutation of the alphabet e.g. 'FKMCPDYEHBIGQROSAZLUTJNWVX,.', along with 2 non-zero digits, e.g., 3 and 7. A straddling checkerboard is set up something like this (using the key information above):

   0 1 2 3 4 5 6 7 8 9
   F K M   C P D   Y E
3: H B I G Q R O S A Z
7: L U T J N W V X , . 

The first row is set up with the first eight key letters, leaving two blank spots for the given digits. It has no row label. The second and third rows are labelled with the two given digits (which didn't get a letter in the top row), and then filled out with the rest of the key letters.

-}

type Litera = Char
type Alfabet = [Litera]

alfabetTest :: Alfabet
alfabetTest = "FKMCPDYEHBIGQROSAZLUTJNWVX,."

type Cifra = Int
type TextCodat = [Cifra]

type Cod = [(Litera,TextCodat)]

-- I.1 (1p) Folosind doar descrieri de liste si functii din categoriile A si B, 
-- si functia de mai sus (fara rescriere):
-- Scrieti o functie care data fiind o lista de cifre, in ordine crescatoare, 
-- calculeaza o lista de continand listele cifrelor  
-- corespunzand tuturor numerelor naturale de doua cifre 
-- care au ca prima cifra una din cifrele date, in ordine crescatoare
-- numere [1,3] = [[1,0], [1,1], ... , [1,9], [3,0], [3,1], ... , [3,9]]
numere :: [Cifra] -> [[Cifra]]
numere = undefined

-- I.2 (2p) Folosind doar functii din categoriile A, B, si C 
-- (fara descrieri de liste sau rescriere)
-- Scrieti o functie care dat fiind un alfabet si doua cifre
-- creaza o lista de perechi (litera, cod), unde codul este o lista de 
-- cifre corespunzatoare cifrului Stradle Chcekerboard alcatuit pe baza 
--- alfabetului si cifrelor date.
--- Punctaj maxim pentru o rezolvare cu cel mult 38 de simboluri
codare :: Alfabet -> Cifra -> Cifra -> Cod
codare = undefined

-- codTest e definit ca un exemplu de cod care il puteti folosi 
-- in definitiile de mai jos.  
codTest :: Cod
codTest = codare alfabetTest 3 7
-- codTest = [('R',[0]),('A',[1]),('U',[2]),('I',[4]),('N',[5]),('E',[7]),('S',[8]),('T',[9]),('X',[3,0]),('-',[3,1]),('P',[3,2]),('O',[3,3]),('V',[3,4]),('L',[3,5]),('F',[3,6]),('M',[3,7]),('Z',[3,8]),('J',[3,9]),('C',[6,0]),('D',[6,1]),('G',[6,2]),('B',[6,3]),('W',[6,4]),('H',[6,5]),('K',[6,6]),('Y',[6,7]),('Q',[6,8]),('.',[6,9])]

{-
Partea II - Codare si Decodare
------------------------------

To encode a text, a letter on the top row is simply replaced by the number labelling its column. Letters on the other rows are replaced by their row number, then column number:

D E F E N  D T  H  E E A  S  T  W  A  L  L  O  F T  H  E C A  S  T  L  E
6 9 0 9 74 6 72 30 9 9 38 37 72 75 38 70 70 36 0 72 30 9 4 38 37 72 70 9

So, DEFEND THE EAST WALL OF THE CASTLE becomes 690975672309938377275387070360723094383772709. 

Decoding is simply the reverse of this process. Although the size of groups can vary, decoding is unambiguous because whenever the next element to be decoded starts with a 3 or a 7, it is a pair; otherwise, it is a single digit.
-}


type TextClar = [Litera]

textClarTest :: TextClar
textClarTest = "Defend the east wall of the castle"

textCodatTest :: TextCodat
textCodatTest = [6,9,0,9,7,4,6,7,2,3,0,9,9,3,8,3,7,7,2,7,5,3,8,7,0,7,0,3,6,0,7,2,3,0,9,4,3,8,3,7,7,2,7,0,9]


-- II.1 (1p) Folosind doar functii din categoriile A, B si descrieri de liste
-- (fara recursie)
-- Definiti o functie care ia ca argumente un cod si un text clar si 
-- calculeaza textul codat dupa algoritmul de mai sus.
-- codeaza codTest textClarTest == textCodatTest
codeaza :: Cod -> TextClar -> TextCodat
codeaza = undefined

-- II.2 (2p) Definiti functia care date fiind un cod si un text codat, 
-- decodeaza textul codat inversand operatiile descrise mai sus.
-- decodeaza codTest textCodatTest == textClarTest
decodeaza :: Cod -> TextCodat -> String
decodeaza = undefined


{-  Partea III - Criptare / Decriptare

The coded text may be sent directly, but usually is first input into a second cipher stage, such as a substitution or transposition step. As a simple example, we will add a secret key number (say, 83729) using non-carrying addition:

  837298372983729837298372983729837298372983729
+ 690974672309938377275387070360723094383772709
= 427162944282657104463659953089550282655655428

Then use the same straddling checkerboard to turn it back into letters:

427162944282657104463659953089550282655655428
CMU DMECCMYMDPU FCCDO PEEPH YEPPFMYMDPPDPPCMY

The final ciphertext is then CMUDMECCMYMDPUFCCDOPEEPHYEPPFMYMDPPDPPCMY. Note that it is a different length compared to the original plaintext. 

-}

type Parola = [Int]

parolaTest :: Parola
parolaTest = [8,3,7,2,9]

textParolatTest :: TextCodat
textParolatTest = [4,2,7,1,6,2,9,4,4,2,8,2,6,5,7,1,0,4,4,6,3,6,5,9,9,5,3,0,8,9,5,5,0,2,8,2,6,5,5,6,5,5,4,2,8]

type TextCriptat = [Litera]

textCriptatTest :: TextCriptat
textCriptatTest = "CMUDMECCMYMDPUFCCDOPEEPHYEPPFMYMDPPDPPCMY"
-- decodeaza codTest textParolatTest == textCriptatTest

-- III.1 (2p) Date fiind o parola si un text codat
-- sa se translateze textul codat prin adunarea modulo 10
-- a fiecarei cifre cu cifra corespunzatoare din parola, 
-- repetand parola de cate ori e necesar.
-- translateaza parolaTest textCodatTest == textParolatTest
translateaza :: Parola -> TextCodat -> TextCodat
translateaza = undefined

-- III.2 (0,5p) Date fiind un cod, o parola si un text clar,
-- sa se calculeze textul criptat obtinut prin
-- codarea textului, translatarea folosind parola, 
-- apoi decodarea textului codat obtinut, 
-- conform algoritmului de mai sus.
-- ATENTIE: In urma translatarii textul se poate termina cu o cifra 
-- care nu poate fi decodata singura.  Oferiti o solutie.
cripteaza :: Cod -> Parola -> TextClar -> TextCriptat
cripteaza = undefined

-- III.3 (0,5p) Date fiind un cod, o parola si un text criptat, 
-- sa se calculeze textul clar obtinut prin inversarea
-- operatiilor de criptare descrise mai sus.
decripteaza :: Cod -> Parola -> TextClar -> TextCriptat
decripteaza = undefined

-- (1p) din oficiu

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

curry :: ((a, b) -> c) -> a -> b -> c
curry snd 1 2 = 2

uncurry :: a -> b -> c -> (a, b) -> c
uncurry (*) (3,7) = 21
-}
