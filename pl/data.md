```maude
*** cu conventia stupida ca o luna are 31 de zile

fmod DATA-CALENDARISTICA is

  protecting NAT .
  protecting BOOL .
  sorts Date .
  subsort Nat < Date .
  
  op _/_/_ : Nat Nat Nat -> Date [ctor] .
  
  vars X N M P : Nat .
  
  op valid : Date -> Bool .
  ceq valid(N / M / P) = true if (N <= 31) and (N >= 1) and (M >= 1) and (M <= 12) and (P >= 1) .
  eq valid(N / M / P) = false .
  
  op add(_,_) : Nat Date -> Nat .
  eq add(X, N / M / P) = ((X + N) rem 31) / ((M + ((X + N) quo 31)) rem 12) / (P + ((M + ((X + N) quo 31)) quo 12)) .
  
endfm
```
```maude
red 1 / 32 / 3 .
red valid(1 / 32 / 3) .
red add(372, 1 / 9 / 3) .
```
