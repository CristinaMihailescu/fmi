-- Informatics 1 - Functional Programming
-- Lab week tutorial part II
--
--

import           Data.Char
import           PicturesSVG
import           Test.QuickCheck
import           Data.List


-- Exercise 1
isFENChar :: Char -> Bool
isFENChar c = if elem (toLower c) ['r','n','b','q','k','p'] || isDigit c || c == '/' then True
              else False


-- Exercise 2.a
besideList :: [Picture] -> Picture
besideList (x:xl) = if length xl == 0 then x
               else (beside x (besideList(xl)))

-- Exercise 2.c
toClear :: Int -> Picture
toClear n = besideList(replicate n clear)

-- Exercise 3
fenCharToPicture :: Char -> Picture
fenCharToPicture c = case c of
                          'p' -> invert pawn
                          'k' -> invert king
                          'n' -> invert knight
                          'q' -> invert queen
                          'b' -> invert bishop
                          'r' -> invert rook
                          'P' -> pawn
                          'K' -> king
                          'N' -> knight
                          'Q' -> queen
                          'B' -> bishop
                          'R' -> rook
                          otherwise -> if isDigit(c) then toClear (digitToInt c)
                                       else Empty
-- Exercise 4
isFenRow :: String -> Bool
isFenRow [] = True
isFenRow (s:sl) = if isFENChar s == False then False
                  else isFenRow sl

-- Exercise 6.a
fenCharsToPictures :: String -> [Picture]
fenCharsToPictures [] = [Empty] --AI GRIJA AICI!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
fenCharsToPictures (x:xs) =  fenCharToPicture x : fenCharsToPictures (xs)

fenRowToPicture :: String -> Picture
fenRowToPicture xs = besideList(fenCharsToPictures xs)

-- Exercise 8.a
-- write a recursive definition for
fenRowsToPictures :: [String] -> [Picture]
fenRowsToPictures [] = [Empty]
fenRowsToPictures (x:xs) = fenRowToPicture x : fenRowsToPictures xs

-- Exercise 8.b
aboveList :: [Picture] -> Picture
aboveList (x:xl) = if length xl == 0 then x
               else (above x (aboveList(xl)))

-- Exercise 8.c
fenToPicture :: [String] -> Picture
fenToPicture xs = aboveList(fenRowsToPictures xs)

emptyRow :: Picture
emptyRow = repeatH 4 (beside whiteSquare(blackSquare))

otherEmptyRow :: Picture
otherEmptyRow = flipV(emptyRow)

board :: Picture
board = repeatV 4 (above emptyRow(otherEmptyRow))

-- Exercise 9
chessBoard :: [String] -> Picture
chessBoard xs = over (fenToPicture xs) (board)

-- Exercise 10
-- write the correct type and definition of
-- allowedMoved
