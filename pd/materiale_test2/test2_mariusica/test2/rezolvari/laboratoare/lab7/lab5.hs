-- Informatics 1 - Functional Programming 
-- Tutorial 5
--
-- Due: the tutorial of week 7 (5/6 November)


import Control.Monad( liftM, liftM2 )
import Data.List( nub )
import Test.QuickCheck( quickCheck, 
                        Arbitrary( arbitrary ),
                        oneof, elements, sized  )

-- Warmup exercises

-- The datatype 'Fruit'
data Fruit = Apple String Bool
           | Orange String Int

-- Some example Fruit
apple, apple', orange :: Fruit
apple  = Apple "Granny Smith" False -- a Granny Smith apple with no worm
apple' = Apple "Braeburn" True     -- a Braeburn apple with a worm
orange = Orange "Sanguinello" 10    -- a Sanguinello with 10 segments

fruits :: [Fruit]
fruits = [Orange "Seville" 12,
          Apple "Granny Smith" False,
          Apple "Braeburn" True,
          Orange "Sanguinello" 10]

-- This allows us to print out Fruit in the same way we print out a list, an Int or a Bool.
instance Show Fruit where
  show (Apple variety hasWorm)   = "Apple("  ++ variety ++ "," ++ show hasWorm  ++ ")"
  show (Orange variety segments) = "Orange(" ++ variety ++ "," ++ show segments ++ ")"

tr :: [String]
tr = ["Tarocco", "Moro", "Sanguinello"]

-- exemple:
-- 1. Folosind case
-- worms x = case x of Apple variety True -> ... 
--                           _ -> ...

-- 2. folosind pattern matching
-- worms (Apple variety True) = case x of Apple variety True -> ... 
-- worms (Orange variety segments) = case x of Apple variety True -> ... 

-- tips: puteti folosi o astfel de declaratie de argument daca aveti nevoie
-- de ambele: fruit ca data structure si campurile lui separate

-- worms fruit@(Orange variety segments) = ... 

-- 1.
isBloodOrange :: Fruit -> Bool
isBloodOrange (Orange variety segments) = variety `elem` tr
isBloodOrange (Apple _ _) = False


-- 2.
getOrangeSegments :: Fruit -> Int
getOrangeSegments (Orange veriety segments) = segments
getOrangeSegments (Apple _ _ ) = 0 

bloodOrangeSegments :: [Fruit] -> Int
bloodOrangeSegments xs = sum (map (getOrangeSegments) (filter (isBloodOrange) xs))

-- 3.
hasWorms :: Fruit -> Bool
hasWorms (Apple variety worm) = worm
hasWorms (Orange _ _) = False

worms :: [Fruit] -> Int
worms xs = length (filter (hasWorms) xs)

-- Implementing propositional logic in Haskell
-- The datatype 'Prop'

type Name = String
data Prop = Var Name
          | F
          | T
          | Not Prop
          | Prop :|: Prop
          | Prop :&: Prop
		  | Prop :->: Prop
		  | Prop :<->: Prop
          deriving (Eq, Ord, Show)

type Names = [Name]
type Env = [(Name, Bool)]


-- Functions for handling Props

-- turns a Prop into a string approximating mathematical notation
showProp :: Prop -> String
showProp (Var x)        =  x
showProp (F)            =  "F"
showProp (T)            =  "T"
showProp (Not p)        =  "(~" ++ showProp p ++ ")"
showProp (p :|: q)      =  "(" ++ showProp p ++ "|" ++ showProp q ++ ")"
showProp (p :&: q)      =  "(" ++ showProp p ++ "&" ++ showProp q ++ ")"
showProp (p :->: q)	    =  "(" ++ showProp p ++ "->" ++ showProp q ++ ")"
showProp (p :<->: q)    =  "(" ++ showProp p ++ "<->" ++ showProp q ++ ")"

-- evaluates a proposition in a given environment
eval :: Env -> Prop -> Bool
eval e (Var x)        =  lookUp x e
eval e (F)            =  False
eval e (T)            =  True
eval e (Not p)        =  not (eval e p)
eval e (p :|: q)      =  eval e p || eval e q
eval e (p :&: q)      =  eval e p && eval e q
eval e (p :->: q)     =  (not (eval e p)) || eval e q
eval e (p :<->: q)	  =  eval e (p :->: q) && eval e (q :->: p)

-- retrieves the names of variables from a proposition - 
--  NOTE: variable names in the result must be unique
names :: Prop -> Names
names (Var x)        =  [x]
names (F)            =  []
names (T)            =  []
names (Not p)        =  names p
names (p :|: q)      =  nub (names p ++ names q)
names (p :&: q)      =  nub (names p ++ names q)
names (p :->: q)     =  nub (names p ++ names q)
names (p :<->: q)    =  nub (names p ++ names q)

-- creates all possible truth assignments for a set of variables
envs :: Names -> [Env]
envs []      =  [[]]
envs (x:xs)  =  [ (x,False):e | e <- envs xs ] ++
                [ (x,True ):e | e <- envs xs ]

-- checks whether a proposition is satisfiable
satisfiable :: Prop -> Bool
satisfiable p  =  or [ eval e p | e <- envs (names p) ]


-- Exercises ------------------------------------------------------------

-- 4.
-- nu pot pune where P = Var "P" => not in scope data constructor P
p1 = ((Var "P") :|: (Var "Q")) :&: ((Var "P") :&: (Var "Q"))
p2 = (Var "P" :|: Var "Q") :&: ((Not (Var "P")) :&: (Not (Var "Q")))
p3 = (Var "P" :&: (Var "Q" :|: Var "R")) :&: (((Not (Var "P")) :|: (Not (Var "Q"))) :&: ((Not (Var "P")) :|: (Not (Var "R"))))


-- 5. 
tautology :: Prop -> Bool
tautology p = and [eval environment p | environment <- envs (names p)] 

prop_taut1 :: Prop -> Bool
prop_taut1 p = tautology p || satisfiable (Not p)

prop_taut2 :: Prop -> Bool
prop_taut2 p = ((satisfiable p) == False) || (tautology (Not p) == False)


-- 6.
p4 = (Var "P" :->: Var "Q") :&: (Var "P" :<->: Var "Q")
p5 = (Var "P" :->: Var "Q") :&: (Var "P" :&: Not (Var "Q"))
p6 = (Var "P" :<->: Var "Q") :&: (Var "P" :&: Not (Var "Q")) :|: (Not (Var "P") :&: Var "Q")


-- 7.
changeVars :: Env -> Names -> Env
changeVars [] [] = []
changeVars (x:xs) (y:ys) = (y,snd x) : (changeVars xs ys)

equivalent :: Prop -> Prop -> Bool
equivalent p1 p2 = and [eval environment p1 == eval environment p2 | environment <- envs (nub(names p1 ++ names p2))]

equivalent' :: Prop -> Prop -> Bool
equivalent' p1 p2 = tautology (p1 :<->: p2)

prop_equivalent :: Prop -> Prop -> Bool
prop_equivalent p1 p2 = equivalent p1 p2 == equivalent' p1 p2


-- 8.
subformulas :: Prop -> [Prop]
subformulas (Var x)        =  [Var x]
subformulas (F)            =  [F]
subformulas (T)            =  [T]
subformulas (Not p)        =  nub ((Not p) : subformulas p)
subformulas (p :|: q)      =  nub ([p :|: q] ++ [p] ++ [q] ++ subformulas p ++ subformulas q)
subformulas (p :&: q)      =  nub ([p :&: q] ++ [p] ++ [q] ++ subformulas p ++ subformulas q)
subformulas (p :->: q)     =  nub ([p :->: q] ++ [p] ++ [q] ++ subformulas p ++ subformulas q)
subformulas (p :<->: q)    =  nub ([p :<->: q] ++ [p] ++ [q] ++ subformulas p ++ subformulas q)


-- Optional Material

-- 9.
-- check for negation normal form
isNNF :: Prop -> Bool
isNNF (Var x) 		= True
isNNF (Not (Var x)) = True
isNNF (F) 			= True
isNNF (T) 			= True
isNNF (Not F) 		= True
isNNF (Not T) 		= True
isNNF (Not _) 		= False
isNNF (p :|: q) 	= isNNF p && isNNF q
isNNF (p :&: q)     =  isNNF p && isNNF q
isNNF (p :->: q)    =  isNNF p && isNNF q
isNNF (p :<->: q)	=  isNNF p && isNNF q


-- 10.
-- convert to negation normal form
toNNF :: Prop -> Prop
toNNF (Var x) 		= Var x
toNNF (Not (Var x)) = Not (Var x)
toNNF (F) 			= F
toNNF (T) 			= T
toNNF (Not F) 		= T
toNNF (Not T) 		= F
toNNF (Not (p :&: q)) 		=  toNNF (Not p)  :|:  toNNF (Not q)
toNNF (Not (p :|: q)) 	    =  toNNF (Not p)  :&:  toNNF (Not q)
toNNF (Not (p :->: q))      =  toNNF p :&: toNNF (Not q)
toNNF (Not (p :<->: q))     =  toNNF (Not (p :->: q)) :|: toNNF (Not (q :->: p))
toNNF (p :->: q)   			=  toNNF (Not p)  :|: (toNNF q)
toNNF (p :<->: q)			=  toNNF (p :->: q) :&: toNNF (q :->: p)
toNNF (p :&: q)     		=  toNNF p :&: toNNF q
toNNF (p :|: q)     		=  toNNF p :|: toNNF q
toNNF (Not (Not p))			=  toNNF p

-- check if result of toNNF is in neg. normal form
prop_NNF1 :: Prop -> Bool
prop_NNF1 p  =  isNNF (toNNF p)

-- check if result of toNNF is equivalent to its input
prop_NNF2 :: Prop -> Bool
prop_NNF2 p  =  equivalent p (toNNF p)


-- 11.
-- check whether a formula is in conj. normal form
isDisjunction :: Prop -> Bool
isDisjunction (T) = True
isDisjunction (F) = True
isDisjunction (Not T) = True
isDisjunction (Not F) = True
isDisjunction (Var x) = True
isDisjunction (Not (Var x)) = True
isDisjunction (p :&: q) = False
isDisjunction (p :|: q) = isDisjunction p  && isDisjunction q
isDisjunction (p :->: q) = False
isDisjunction (p :<->: q) = False

isCNF :: Prop -> Bool
isCNF (p :&: q) = isCNF p && isCNF q
isCNF (Var x) = True
isCNF p = isDisjunction p

-- 13.
-- transform a list of lists into a (CNF) formula
toDisjunction :: [Prop] -> Prop
toDisjunction (x:xs)
 |null xs = x
 |otherwise = x :|: (toDisjunction xs)

listsToCNF :: [[Prop]] -> Prop
listsToCNF (x:xs) 
 |null xs = toDisjunction x
 |otherwise = (toDisjunction x) :&: listsToCNF (xs) 


-- 14.
-- transform a CNF formula into a list of lists
fromDisjToList :: Prop -> [Prop]
fromDisjToList (p :|: q) = fromDisjToList p ++ fromDisjToList q
fromDisjToList p = [p]

listsFromCNF :: Prop -> [[Prop]]
listsFromCNF (p :&: q) = listsFromCNF p  ++ listsFromCNF q
listsFromCNF p = [fromDisjToList p]


-- 15.
-- transform an arbitrary formula into a list of lists
makeDisjunction :: [Prop] -> Prop
makeDisjunction (x:xs)
 |null xs = x
 |otherwise =  x :|: (makeDisjunction xs)

distributiveLaw :: Prop -> Prop
distributiveLaw (p :|: q) = foldr (:&:) T [(makeDisjunction p1) :|: (makeDisjunction q1) | p1 <- listsFromCNF p, q1 <- listsFromCNF q]
 
 
toCNFList :: Prop -> [[Prop]]
toCNFList p = listsFromCNF (getCNF p)

getCNF :: Prop -> Prop
getCNF 


-- convert to conjunctive normal form
toCNF :: Prop -> Prop
toCNF p  =  listsToCNF (toCNFList p)

-- check if result of toCNF is equivalent to its input
prop_CNF :: Prop -> Bool
prop_CNF p  =  equivalent p (toCNF p)




-- For QuickCheck --------------------------------------------------------

--instance Show Prop where
  --  show  =  showProp

instance Arbitrary Prop where
    arbitrary  =  sized prop
        where
          prop n | n <= 0     =  atom
                 | otherwise  =  oneof [ atom
                                       , liftM Not subform
                                       , liftM2 (:|:) subform subform
                                       , liftM2 (:&:) subform subform
                                       , liftM2 (:->:) subform subform
                                       , liftM2 (:<->:) subform' subform'
                                       ]
                 where
                   atom = oneof [liftM Var (elements ["P", "Q", "R", "S"]),
                                   elements [F,T]]
                   subform  =  prop (n `div` 2)
                   subform' =  prop (n `div` 4)


-- For Drawing Tables ----------------------------------------------------

-- centre a string in a field of a given width
centre :: Int -> String -> String
centre w s  =  replicate h ' ' ++ s ++ replicate (w-n-h) ' '
            where
            n = length s
            h = (w - n) `div` 2

-- make a string of dashes as long as the given string
dash :: String -> String
dash s  =  replicate (length s) '-'

-- convert boolean to T or F
fort :: Bool -> String
fort False  =  "F"
fort True   =  "T"

-- print a table with columns neatly centred
-- assumes that strings in first row are longer than any others
showTable :: [[String]] -> IO ()
showTable tab  =  putStrLn (
  unlines [ unwords (zipWith centre widths row) | row <- tab ] )
    where
      widths  = map length (head tab)

table p = tables [p]

tables :: [Prop] -> IO ()
tables ps  =
  let xs = nub (concatMap names ps) in
    showTable (
      [ xs            ++ ["|"] ++ [showProp p | p <- ps]           ] ++
      [ dashvars xs   ++ ["|"] ++ [dash (showProp p) | p <- ps ]   ] ++
      [ evalvars e xs ++ ["|"] ++ [fort (eval e p) | p <- ps ] | e <- envs xs]
    )
    where  dashvars xs        =  [ dash x | x <- xs ]
           evalvars e xs      =  [ fort (eval e (Var x)) | x <- xs ]

-- print a truth table, including columns for subformulas
fullTable :: Prop -> IO ()
fullTable = tables . filter nontrivial . subformulas
    where nontrivial :: Prop -> Bool
          nontrivial (Var _) = False
          nontrivial T       = False
          nontrivial F       = False
          nontrivial _       = True


-- Auxiliary functions

lookUp :: Eq a => a -> [(a,b)] -> b
lookUp z xys  =  the [ y | (x,y) <- xys, x == z ]
    where the [x]  =  x
          the _    =  error "eval: lookUp: variable missing or not unique"