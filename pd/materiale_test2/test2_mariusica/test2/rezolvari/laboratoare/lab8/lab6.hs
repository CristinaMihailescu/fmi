-- Informatics 1 Functional Programming
-- Tutorial 6
--
-- Due: 12/13 November

import System.Random


-- Importing the keymap module

import KeymapTree


-- Type declarations

type Barcode = String
type Product = String
type Unit    = String

type Item    = (Product,Unit)

type Catalogue = Keymap Barcode Item


-- A little test catalog

testDB :: Catalogue
testDB = fromList [
 ("0265090316581", ("The Macannihav'nmor Highland Single Malt", "75ml bottle")),
 ("0903900739533", ("Bagpipes of Glory", "6-CD Box")),
 ("9780201342758", ("Thompson - \"Haskell: The Craft of Functional Programming\"", "Book")),
 ("0042400212509", ("Universal deep-frying pan", "pc"))
 ]


-- Exercise 1

longestProductLen :: [(Barcode, Item)] -> Int
longestProductLen xs = maximum [length name | name <- map (fst.snd) xs]

makePoints :: Int -> String
makePoints 0 = []
makePoints nr = '.' : makePoints (nr-1)

formatLine :: Int -> (Barcode, Item) -> String
formatLine size (code,item) = code ++ "..." ++ fst(item) ++ makePoints(size - length(fst(item))) ++ "..." ++ snd(item);

addNewLine :: [String] -> [String]
addNewLine [] = []
addNewLine (x:xs) = (x ++ "\n") : (addNewLine xs)

showCatalogue :: Catalogue -> String
showCatalogue cat = concat (addNewLine [line | line <- map (formatLine (longestProductLen (toList cat))) (toList cat)]);
     
-- Exercise 2
maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = x : []

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:xs) = Just x


removeJust :: Maybe a -> a
removeJust (Just a) = a

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing : xs) = catMaybes xs
catMaybes (x:xs) = (removeJust x) : (catMaybes xs)

-- Exercise 3
getMaybeList :: [Barcode] -> Catalogue -> [Maybe Item]
getMaybeList [] cat = []
getMaybeList (b:bx) cat = (get b cat) : (getMaybeList bx cat)

getItems :: [Barcode] -> Catalogue -> [Item]
getItems xs cat = catMaybes (getMaybeList xs cat) 

-- Exercise 4
-- b : 0.03
-- c : it looks at length(catalogue) items




-- Input-output ------------------------------------------

readDB :: IO Catalogue
readDB = do dbl <- readFile "database.csv"
            let db = fromList (map readLine $ lines dbl)
            putStrLn (size db >= 0 `seq` "Done")
            return db

readLine :: String -> (Barcode,Item)
readLine str = (a,(c,b))
    where
      (a,str2) = splitUpon ',' str
      (b,c)    = splitUpon ',' str2

splitUpon :: Char -> String -> (String,String)
splitUpon _ "" = ("","")
splitUpon c (x:xs) | x == c    = ("",xs)
                   | otherwise = (x:ys,zs)
                   where
                     (ys,zs) = splitUpon c xs

getSample :: Catalogue -> IO Barcode
getSample db = do g <- newStdGen
                  return $ fst $ toList db !! fst (randomR (0,size db - 1) g)