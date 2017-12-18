-- Informatics 1 - Functional Programming 
-- Tutorial 9
--


import LSystem
import Test.QuickCheck

-- Exercise 1

-- 1a. split
split :: Command -> [Command]
split (Go d) = [Go d]
split (Turn a) = [Turn a]
split Sit = [Sit]
split (c1 :#: c2) = split c1 ++ split c2

-- 1b. join
join :: [Command] -> Command
join [] = Sit
join ((Go d) : l) = Go d :#: join l
join ((Turn a) : l) = Turn a :#: join l
join (Sit : l) = Sit :#: join l
join (c : l) = join [c] :#: join l

-- 1c  equivalent
equivalent = undefined

-- 1d. testing join and split
prop_split_join = undefined

prop_split = undefined


-- Exercise 2
-- 2a. copy
copy :: Int -> Command -> Command
copy 1 c = c
copy i c = c :#: copy (i-1) c

-- 2b. pentagon
pentagon :: Distance -> Command
pentagon d = copy 5 (Go d :#: Turn 72.0)

-- 2c. polygon
polygon :: Distance -> Int -> Command
polygon d i = copy i (Go d :#: Turn (360/(fromIntegral i)))



-- Exercise 3
-- spiral
spiral :: Distance -> Int -> Distance -> Angle -> Command
spiral _ 0 _ _ = Sit
spiral side n step angle = Go side :#: Turn angle :#: spiral (side+step) (n-1) step angle


-- Exercise 4
-- optimise
optimise :: Command -> Command
optimise = undefined
--optimise (Go 0) = Sit
--optimise (Turn 0) = Sit
--optimise (Go d :#: Go e) = Go (d+e)
--optimise (Turn a :#: Turn b) = Turn (a+b)
--optimise (c1 :#: c2) = c1 :#: c2


-- L-Systems

-- 5. arrowhead
--                angle:      60
--                start:      f
--                rewrite:    f → g+f+g
--                            g → f-g-f
arrowhead :: Int -> Command
arrowhead x = f x
    where
    f 0 = GrabPen green :#: Go 5
    f x = g (x-1) :#: Branch (p :#: f(x-1)) :#: (p :#: g(x-1))
    g 0 = GrabPen blue :#: Go 5
    g x = f (x-1) :#: Branch (n :#: g(x-1)) :#: Branch (n :#: f(x-1))
    n = Turn 65
    p = Turn (-25)

-- 6. snowflake
                -- angle:      60
                -- start:      f- -f- -f- -
                -- rewrite:    f → f+f- -f+f
--snowflake :: Int -> Command
-- snowflake x = (f(x-1) :#: (Go 5)
            -- :#: n :#:  (n :#: f(x-1) :#: Go 5)
            -- :#: n :#:  (n :#: f(x-1) :#: Go 5) :#: n)
--snowflake x = f x :#: n :#: n :#: f x :#: n :#: n :#: f x :#: n
--    where
--    f 0 = GrabPen (Colour 1 0 1) :#: Go 5
--    f x = f(x-1) :#: Branch (p :#: f(x-1)) :#: Branch f(x-1) :#: n :#: Branch n :#: f(x-1) :#: Branch f(x-1)
--    n = Turn 60
--    p = Turn (-60)
    

-- 7. hilbert
hilbert :: Int -> Command
hilbert = undefined

main :: IO ()
main = display (Go 30 :#: Turn 120 :#: Go 30 :#: Turn 120 :#: Go 30)
