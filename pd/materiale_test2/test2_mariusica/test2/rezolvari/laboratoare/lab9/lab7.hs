-- Informatics 1 - functional Programming 
-- Tutorial 7
--
-- Week 9 - Due: 19/20 Nov.


import LSystem
import Test.QuickCheck

data LMove = Plus | Minus | Bracket [LMove] | Id Char

data LRule = LRule {
    left  :: Char
  , right :: [LMove]
}

data LSystem = LSystem {
    angle :: Angle
  , start :: [LMove]
  , rewrite  :: [LRule]
  , drawing :: [LMove]
}

-- Exercise 1

-- 1a. split
split :: Command -> [Command]
split (Go dist) = [Go dist]
split (Turn ang) = [Turn ang]
split Sit = []
split (com1 :#: com2) = split(com1) ++ split(com2)

-- 1b. join
join :: [Command] -> Command
join list = foldr (:#:) Sit list

-- 1c  equivalent
equivalent :: Command -> Command -> Bool
equivalent com1 com2 = (split com1) == split(com2) 

-- 1d. testing join and split
prop_split_join :: Command -> Bool
prop_split_join com = equivalent (join (split com)) com

prop_split :: Command -> Bool
prop_split com = prop_split_help (split com)

prop_split_help :: [Command] -> Bool
prop_split_help [] = True
prop_split_help (Sit:xs) = False
prop_split_help ((c1 :#: c2):xs) = False
prop_split_help (x:xs) = prop_split_help xs

-- Exercise 2
-- 2a. copy
copy :: Int -> Command -> Command
copy n com = join . concat $ replicate n (split com)

-- 2b. pentagon
pentagon :: Distance -> Command
pentagon dist = copy 5 (Go dist :#: Turn 72)

-- 2c. polygon
polygon :: Distance -> Int -> Command
polygon dist n = copy n (Go dist :#: Turn (getAngle n))

getAngle :: Int -> Float
getAngle n = (fromIntegral 360) / (fromIntegral n)


-- Exercise 3
-- spiral
spiral :: Distance -> Int -> Distance -> Angle -> Command
spiral side 0 step angle = Sit
spiral side n step angle
 |side > 0 = (Go side) :#: (Turn angle) :#: (spiral (side + step) (n-1) step angle) 
 |side <=0 = Sit

-- Exercise 4
-- optimise
removeSit :: [Command] -> [Command]
removeSit [] = []
removeSit (x:xs)
 |x == Sit = removeSit xs
 |x == Go 0 = removeSit xs
 |x == Turn 0 = removeSit xs
 |otherwise = x : removeSit xs

optimise :: Command -> Command
optimise com = join2 (optimise2 (removeSit (split com)))

optimise2 :: [Command] -> [Command]
optimise2 ((Go dist1):(Go dist2):xs)
 |dist1+dist2 == 0.0 = optimise2 xs
 |otherwise = optimise2 ((Go (dist1 + dist2)) : xs)
optimise2 ((Turn ang1):(Turn ang2):xs)
 |ang1+ang2 == 0.0 = optimise2 xs
 |otherwise = optimise2 ((Turn (ang1 + ang2)) : xs)
optimise2 (x:xs) = x : optimise2 xs
optimise2 [] = []

join2 :: [Command] -> Command
join2 (x:xs)
 |xs == [] = x
 |otherwise = x :#: (join2 xs)

-- L-Systems

-- 5. arrowhead
arrowhead :: Int -> Command
arrowhead x = f x
 where
 f 0 = GrabPen red :#: Go 10
 f x = g (x-1) :#: p :#: f (x-1) :#: p :#: g (x-1)
 g 0 = GrabPen blue :#: Go 10
 g x = f (x-1) :#: n :#: g (x-1) :#: n :#: f (x-1)
 n   = Turn 60
 p   = Turn (-60)
 
-- 6. snowflake
snowflake :: Int -> Command
snowflake x = f x :#: n :#: n :#: f x :#: n :#: n :#: f x :#: n :#: n
 where
 f 0 = Go 10 
 f x = f (x-1) :#: p :#: f (x-1) :#: n :#: n :#: f (x-1) :#: p :#: f (x-1)
 n   = Turn 60
 p   = Turn (-60)

-- 7. hilbert
hilbert :: Int -> Command
hilbert x = l x
 where
 f x = Go 10
 l 0 = Go 10
 l x = p :#: r (x-1) :#: f (x-1) :#: n :#: l (x-1) :#: f (x-1) :#: l (x-1) :#: n :#: f (x-1) :#: r (x-1) :#: p
 r 0 = Go 10
 r x = n :#: l (x-1) :#: f (x-1) :#: p :#: r (x-1) :#: f (x-1) :#: r (x-1) :#: p :#: f (x-1) :#: l (x-1) :#: n
 n   = Turn 90
 p   = Turn (-90)

main :: IO ()
main = display (Go 30 :#: Turn 120 :#: Go 30 :#: Turn 120 :#: Go 30)


--8. peano-gosper
peanogosper :: Int -> Command
peanogosper x = f x
 where
 f 0 = Go 10
 f x = f (x-1) :#: p :#: g (x-1) :#: p :#: p :#: g (x-1) :#: n :#: f (x-1) :#: n :#: n :#: f (x-1) :#: f (x-1) :#: n :#: g (x-1) :#: p
 g 0 = Go 10
 g x = n :#: f (x-1) :#: p :#: g (x-1) :#: g (x-1) :#: p :#: p :#: g (x-1) :#: p :#: f (x-1) :#: n :#: n :#: f (x-1) :#: n :#: g (x-1)
 n = Turn 60
 p = Turn (-60)

 
-- 9. cross
cross :: Int -> Command
cross x = f x :#: n :#: f x :#: n :#: f x :#: n :#: f x :#: n
 where
 f 0 = Go 10
 f x = f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1) :#: p :#: f (x-1) :#: f (x-1) :#: n :#: f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1)
 n = Turn 90
 p = Turn (-90)
 
 
-- 10. branch
mybranch :: Int -> Command
mybranch x = g x
 where
 g 0 = GrabPen green :#: Go 10
 g x = f (x-1) :#: n :#: Branch(Branch(g (x-1)) :#: p :#: g(x-1)) :#: p :#: f (x-1) :#: Branch(p :#: f (x-1) :#: g (x-1)) :#: n :#: g (x-1)
 f 0 = GrabPen green :#: Go 10
 f x = f (x-1) :#: f (x-1)
 n = Turn 22.5
 p = Turn (-2.5)
 
 

-- 11. 32segment
mysegment :: Int -> Command
mysegment x = f x :#: p :#: f x :#: p :#: f x :#: p :#: f x
 where
 f 0 = Go 10
 f x = n :#: f (x-1) :#: p :#: f (x-1) :#: n :#: f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1) :#: p :#: f (x-1) :#: f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1) :#: p :#: f (x-1) :#: f (x-1) :#: p :#: f (x-1) :#: n :#: f (x-1) :#: n :#: f (x-1) :#: f (x-1) :#: p :#: f (x-1) :#: f (x-1) :#: n :#: f (x-1) :#: f (x-1) :#: p :#: f (x-1) :#: p :#: f (x-1) :#: n :#: f (x-1) :#: f (x-1) :#: n :#: f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1) :#: f (x-1) :#: n :#: f (x-1) :#: n :#: f (x-1) :#: p :#: f (x-1) :#: p :#: f (x-1) :#: n :#: f (x-1) :#: p
 n = Turn 90
 p = Turn (-90)
 
 

-- 12. challenge
--startCommand :: [LMove] -> Command
--startCommand (Plus:xs) = p :#: (startCommand xs)
--startCommand (Minus:xs) = n :#: (startCommand xs)
--startCommand ((Bracket[moves]):xs) = Branch(startCommand moves) :#: (startCommand xs)
--startCommand ((Id chr):xs)
-- |isDrawing chr == True = 
 

--toTurtle :: LSystem -> Int -> Command
--toTurtle sys x = getStart (start(sys))
 --where
 


--dat un sistem si o adancime, mergem prin lista de Lmoves si inlocuim












