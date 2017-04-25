```maude
fmod LIST-INT2 is
  protecting INT .
  sorts NList List .
  subsort Int < NList < List .
  op nil : -> List .
  op _ _ : Int List -> NList [id: nil] .
endfm

fmod EX1 is
  protecting LIST-INT2 .
  
  vars N F : Nat .
  var L : NList .
  vars L1 L2 : List .
  
  op _in_ : Int NList -> Bool .
  eq N in nil = false .
  eq N in N L = true .
  eq N in F L = N in L .
  
  op append : List List -> List .
  eq append(L1, L2) = L1 L2 .
  
  op rev : List -> List .
  eq rev(nil) = nil .
  eq rev(N L1) = rev(L1) N .
  
  op min : List -> Nat .
  eq min(N) = N .
  eq min(N L1) = if N <= min(L1) then N else min(L1) fi .
  
  op del : Nat List -> List .
  eq del(N, N) = nil .
  eq del(N, N L1) = L1 .
  eq del(N, F L1) = F del(N, L1) .
  
  op sort : List -> List .
  eq sort(nil) = nil .
  eq sort(N) = N .
  eq sort(N L1) = if N <= min(L1) then N sort(L1) else min(L1) sort(N del(min(L1), L1)) fi .
   
endfm
```
```maude
red 1 in 1 2 3 4 .
red append(1 2, 3 4) .
red rev(1 2 3 4) .
red min(1 2 3 4 0) .
red del(2, 2 1 4 5) .
red sort(2 5 1 2 0 2 4 9) .
```
```maude
fmod EX3 is
  protecting INT .
  sort List .
  subsort Int < List .
  op nil : -> List .
  op _ _ : Int List -> List [id: nil] .
  
  vars L L1 L2 : List .
  vars N P : Int .
  
  op length : List -> Nat .
  eq length(nil) = 0 .
  eq length(N L) = 1 + length(L) .
  
  op comp : List List -> Bool .
  ***eq comp(nil, nil) = false .
  eq comp(N L1, N L2) = comp(L1, L2) .
  ceq comp(N L1, P L2) = true if N < P .
  eq comp(L1, L2) = false .
  
  op _<<<_ : List List -> Bool .
  ceq L1 <<< L2 = true if length(L1) < length(L2) .
  ceq L1 <<< L2 = comp(L1, L2) if length(L1) == length(L2) .
  eq L1 <<< L2 = false .
endfm
```
```maude
red length(1 2 3) .
red 1 2 3 <<< 4 5 6 8 .
red 1 2 3 <<< 4 5 .
red 1 2 3 <<< 1 2 3 .
red 1 2 3 <<< 1 2 3 4 .
```
```maude
fmod EX4 is
  
  protecting INT .
  sort List .
  subsort Int < List .
  op nil : -> List .
  op _ _ : Int List -> List [id: nil] .
  
  vars X Y N : Int .
  var L : List .
  
  op replace : Int Int List -> List .
  eq replace(X, Y, nil) = nil .
  eq replace(X, Y, X L) = Y replace(X, Y, L) .
  eq replace(X, Y, N L) = N replace(X, Y, L) .
  
  op length : List -> Nat .
  eq length(nil) = 0 .
  eq length(N L) = 1 + length(L) .
  
  op add : Int List -> List .
  eq add(X, nil) = nil .
  eq add(X, N L) = N X add(X, L) .
  
endfm
```
```maude
red replace(1, 0, 1 9 2 1 4 1) .
red add(0, 0 1 2 3 4 5 6 7) .
```
