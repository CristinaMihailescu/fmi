
data Expr = Var String
          | Const Int
          | Neg Expr
          | Plus Expr Expr
          | Times Expr Expr
          deriving Show


-- Ex 1
transform :: (Expr -> Expr) -> Expr -> Expr
transform f s@(Var _) = f s
transform f i@(Const _) = f i
transform f (Neg e) = f $ Neg $ transform f e
transform f (e `Plus` g) = f $ transform f e `Plus` transform f g
transform f (e `Times` g) = f $ transform f e `Times` transform f g

-- (-) -4 + x  ==>  -(---4 + -x)   expr initiala, apoi -4, apoi 4
--transform (\x -> Neg x) (Plus (Neg (Const 4)) (Var "x")) ==
--    Neg (Plus (Neg (Neg (Neg (Const 4)))) (Neg (Var "x")))
--transform (\x -> Neg x) (Times (Const 7) (Const 8)) ==
--    Neg (Times (Neg (Const 7)) (Neg (Const 8)))


-- Ex 2
subLocal :: (String -> Expr) -> Expr -> Expr
subLocal f (Var s) = f s
subLocal _ e = e

x1y2 name = if name == "x" then Const 1 else Const 2
--subLocal x1y2 (Var "x") == Const 1
--subLocal x1y2 (Const 7) == Const 7


-- Ex 3
substitute :: (String -> Expr) -> Expr -> Expr
substitute f = transform $ subLocal f
--substitute x1y2 (Var "x") == Const 1
--substitute x1y2(Neg (Var "x")) == Neg (Const 1)
--substitute x1y2 (Plus (Var "x") (Var "y")) == Plus (Const 1) (Const 2)
--substitute x1y2 (Neg (Times (Plus (Const 7) (Var "x")) (Var "y"))) ==
--Neg (Times (Plus (Const 7) (Const 1)) (Const 2))


-- Ex 4
-- singura problema e ca reduce nu e tocmai local
reduce :: Expr -> Expr
reduce s@(Var _) = s
reduce i@(Const _) = i
reduce (Const 0 `Plus` Const a) = Const a
reduce (Const a `Plus` Const 0) = Const a
reduce (Const 1 `Times` Const a) = Const a
reduce (Const a `Times` Const 1) = Const a
reduce (Neg (Neg e)) = reduce e
reduce (e1 `Plus` e2) = reduce $ reduce e1 `Plus` reduce e2
reduce (e1 `Times` e2) = reduce $ reduce e1 `Times` reduce e2
reduce (Neg e1) = Neg $ reduce e1
--reduce (Plus (Const 0) (Const 7)) == Const 7
--reduce (Times (Const 7) (Const 1)) == Const 7
--reduce (Neg (Neg (Const 7))) == Const 7


-- Ex 5
simplify :: (String -> Expr) -> Expr -> Expr
simplify f (e `Plus` g) = reduce $ reduce e' `Plus` reduce g' where e' = substitute f e; g' = substitute f g
simplify f (e `Times` g) = reduce $ reduce e' `Times` reduce g' where e' = substitute f e; g' = substitute f g
simplify f e = reduce e' where e' = substitute f e
--simplify x1y2 (Neg (Neg (Var "x"))) == Const 1
--simplify x1y2 (Neg (Plus (Var "x") (Const 0))) == Neg (Const 1)
--simplify x1y2 (Times (Const 1) (Plus (Var "y") (Const 0))) == Const 2


