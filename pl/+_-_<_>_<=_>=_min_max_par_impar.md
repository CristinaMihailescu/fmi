```maude
fmod MYNAT-SIMPLE is
  sorts Zero NzNat Nat .
  subsort Zero NzNat < Nat .
  op 0 : -> Nat .
  op s : Nat -> NzNat .
  op p : NzNat -> Nat .
  op _+_ : Nat Nat -> Nat [assoc comm prec 33] .
  op _-_ : Nat Nat -> Nat [assoc prec 33] .
  op _<_ : Nat Nat -> Bool .
  op _<=_ : Nat Nat -> Bool .
  op _>_ : Nat Nat -> Bool .
  op _>=_ : Nat Nat -> Bool .
  op min : Nat Nat -> Nat .
  op max : Nat Nat -> Nat .
  op par : Nat -> Bool .
  op impar : Nat -> Bool .
  op cmmdc : Nat Nat -> Nat .
  
  vars N M : Nat .
  
  eq s(p(N)) = N .
  eq p(s(N)) = N .
  
  eq 0 + M = M .
  eq s(N) + M = s(N + M) .
  
  eq N - 0 = N .
  eq N - s(M) = p(N - M) .
  eq N - p(M) = s(N - M) .
  
  *** lab 6
  
  eq 0 < N = true .
  ceq s(N) < s(M) = true if (N < M) .
  ceq s(N) < s(M) = false if (M < N) or (N == M).
  
  eq 0 > N = false .
  eq N > M = M < N .
  
  ceq N <= M = true if (N < M) or (N == M) .
  ceq N <= M = false if (N > M) .
  ceq N >= M = true if (M <= N) .
  ceq N >= M = false if (M > N) .
  
  ceq min(N, M) = N if (N <= M) .
  ceq min(N, M) = M if (M < N) .
  
  ceq max(N, M) = N if (N >= M) .
  ceq max(N, M) = M if (M > N).
  
  eq par(0) = true .
  eq par(s(0)) = false .
  ceq par(s(s(N))) = true if (par(N) == true) .
  ceq par(s(s(N))) = false if (par(N) == false) .
  
  ceq impar(N) = false if (par(N) == true) .
  ceq impar(N) = true if (par(N) == false) .

  eq cmmdc(0, N) = N .
  ceq cmmdc(N, M) = cmmdc(N - M, M) if (N > M) .
  ceq cmmdc(N, M) = cmmdc(N, M - N) if (N < M) .
  ceq cmmdc(N, M) = N if (N == M) .
  
endfm
```
```maude
red s(s(s(0))) - s(0) .
red s(s(s(0))) - s(s(0)) .

red s(s(s(0))) + s(0) .
red s(s(s(0))) < s(0) .
red s(s(s(0))) > s(0) .
red s(s(s(0))) <= s(0) .
red s(s(s(s(0)))) >= s(s(s(0))) .
red s(s(s(0))) <= s(s(s(0))) .
red s(s(s(0))) >= s(s(s(0))) .
red min(s(s(s(0))), s(0)) .
red max(s(s(s(0))), s(0)) .
red par(s(s(s(0)))).
red par(s(s(s(s(0))))).
red impar(s(s(s(0)))).
red impar(s(s(s(s(0))))).
red cmmdc(s(s(s(s(0)))),s(s(s(s(s(s(s(s(s(0)))))))))) .
```
