-- Informatics 1 - Functional Programming
-- Lab Week Exercise
--
-- Week 2 - due: Friday, Oct 2nd, 5pm
--
-- Insert your name and matriculation number here:
-- Name:
-- Nr. :


import Test.QuickCheck


-- Exercise 3:

double :: Int -> Int
double x = x + x

square :: Int -> Int
square x = x * x

-- Exercise 4:

isTriple :: Int -> Int -> Int -> Bool
isTriple a b c = square a + square b == square c


-- Exercise 5:

leg1 :: Int -> Int -> Int
leg1 x y = square x - square y

leg2 :: Int -> Int -> Int
leg2 x y = 2 * x * y

hyp :: Int -> Int -> Int
hyp x y = square x + square y


-- Exercise 6:

prop_triple :: Int -> Int -> Bool
prop_triple x y = isTriple (leg1 x y) (leg2 x y) (hyp x y)