data Expr = Var String
          | Const Int
          | Neg Expr
          | Plus Expr Expr
          | Times Expr Expr
          deriving Show

x1y2 name = if name == "x" then Const 1 else Const 2 

transform :: (Expr -> Expr) -> Expr -> Expr
transform t (Var x) = t (Var x)
transform t (Const c) = t (Const c)
transform t (Neg e) = t $ Neg $ transform t e
transform t (Plus e1 e2) = t $ transform t e1 `Plus` transform t e2
transform t (Times e1 e2) = t $ transform t e1 `Times` transform t e2

subLocal :: (String -> Expr) -> Expr -> Expr
subLocal s (Var x) = s x
subLocal _ e = e

substitute :: (String -> Expr) -> Expr -> Expr
substitute s = transform $ subLocal s

reduce :: Expr -> Expr
reduce (Const a `Plus` Const 0) = Const a
reduce (Const a `Times` Const 0) = Const 0
reduce (Const a `Times` Const 1) = Const a
reduce (Const 0 `Plus` Const a) = Const a
reduce (Const 0 `Times` Const a) = Const 0
reduce (Const 1 `Times` Const a) = Const a
reduce (Neg(Neg e)) = reduce e
reduce (Neg e) = Neg (reduce e)
reduce (Var x) = Var x
reduce (Const c) = Const c
reduce (e1 `Plus` e2) = reduce $ reduce e1 `Plus` reduce e2
reduce (e1 `Times` e2) = reduce $ reduce e1 `Times` reduce e2

simplify :: (String -> Expr) -> Expr -> Expr
simplify s e = reduce $ substitute s e