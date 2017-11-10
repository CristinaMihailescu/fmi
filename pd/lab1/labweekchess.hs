-- Informatics 1 - Functional Programming 
-- Lab week tutorial part II
--
--

import PicturesSVG
import Test.QuickCheck
import Data.Char

--render (above (beside rook(beside knight(beside bishop(beside queen(beside king(beside bishop(beside knight(rook))))))))(repeatH 8 pawn))


-- Exercise 8:
pic1 :: Picture
pic1 = above knight(invert knight)
--render (beside pic1(invert pic1))
--sau
--render (beside (above knight(invert knight))(invert (above knight(invert knight))))

pic2 :: Picture
pic2 = above knight(flipV(invert knight))
--render (beside pic2(invert pic2))
--sau
--render (beside (above knight(flipV (invert knight)))(above (invert knight)(flipV(knight))))


-- Exercise 9:
-- a)

emptyRow :: Picture
emptyRow = repeatH 4 (beside whiteSquare(blackSquare))

-- b)

otherEmptyRow :: Picture
otherEmptyRow = flipV(emptyRow)

-- c)

middleBoard :: Picture
middleBoard = repeatV 2 (above emptyRow(otherEmptyRow))

-- d)

mainPieces :: Picture
mainPieces = beside rook(beside knight(beside bishop(beside queen(beside king(beside bishop(beside knight(rook)))))))

pawnPieces :: Picture
pawnPieces = repeatH 8 pawn

whiteRow :: Picture
whiteRow = over (above pawnPieces(mainPieces)) (above emptyRow(otherEmptyRow))

blackRow :: Picture
blackRow = over (above (invert mainPieces)(invert pawnPieces)) (above emptyRow(otherEmptyRow))

-- e)

populatedBoard :: Picture
populatedBoard = above blackRow(above middleBoard(whiteRow))



-- Functions --

twoBeside :: Picture -> Picture
twoBeside x = beside x (invert x)


-- Exercise 10:

twoAbove :: Picture -> Picture
twoAbove x = above x (invert x)

fourPictures :: Picture -> Picture
fourPictures x = twoBeside(twoAbove x)

