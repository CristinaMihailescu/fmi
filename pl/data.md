```maude
fmod DATA-CALENDARISTICA is

  sorts Nat Date .
  subsort Nat < Date .
  op 0 : -> Nat .
  op s_ : Nat -> Nat .
  
  op _<_ : Nat Nat -> Bool .
  op _<=_ : Nat Nat -> Bool .
  op _>_ : Nat Nat -> Bool .
  op _>=_ : Nat Nat -> Bool .
  
  op _/_/_ : Nat Nat Nat -> Date [ctor] .
  
  vars N M P : Nat .
  
  eq 0 < N = true .
  ceq s(N) < s(M) = true if (N < M) .
  ceq s(N) < s(M) = false if (M < N) or (N == M).
  
  eq 0 > N = false .
  eq N > M = M < N .
  
  ceq N <= M = true if (N < M) or (N == M) .
  ceq N <= M = false if (N > M) .
  ceq N >= M = true if (M <= N) .
  ceq N >= M = false if (M > N) .
  
  op valid : Date -> Bool .
  ceq valid(N / M / P) = true if (N >= s(s(0))) and (M >= s(s(0))) and (P >= s(s(0))) .
  eq valid(N / M / P) = false .
  
endfm
```
```maude
red s(0) / s(0) / s(0) .
red valid(s(0) / s(0) / s(0)) .
```
